import Foundation

@MainActor
final class GuideStore: ObservableObject {
    @Published private(set) var entries: [GuideEntry] = []
    @Published private(set) var personas: [Persona] = []
    @Published var favoriteIDs: Set<String> {
        didSet { UserDefaults.standard.set(Array(favoriteIDs), forKey: Self.favoritesKey) }
    }
    @Published var selectedPersonaID: String? {
        didSet { UserDefaults.standard.set(selectedPersonaID, forKey: Self.personaKey) }
    }
    @Published var doneStepKeys: Set<String> {
        didSet { UserDefaults.standard.set(Array(doneStepKeys), forKey: Self.stepsKey) }
    }
    @Published var searchText: String = ""
    @Published var selectedCategory: GuideCategory?

    private static let favoritesKey = "favoriteEntryIDs"
    private static let personaKey = "selectedPersonaID"
    private static let stepsKey = "doneStepKeys"

    init() {
        let defaults = UserDefaults.standard
        favoriteIDs = Set(defaults.stringArray(forKey: Self.favoritesKey) ?? [])
        selectedPersonaID = defaults.string(forKey: Self.personaKey)
        doneStepKeys = Set(defaults.stringArray(forKey: Self.stepsKey) ?? [])
        let loadedEntries: [GuideEntry]? = Self.load("apps")
        let loadedPersonas: [Persona]? = Self.load("personas")
        entries = loadedEntries ?? []
        personas = loadedPersonas ?? []
    }

    private static func load<T: Decodable>(_ resource: String) -> T? {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    // MARK: - Favorites

    func toggleFavorite(_ entry: GuideEntry) {
        if favoriteIDs.contains(entry.id) {
            favoriteIDs.remove(entry.id)
        } else {
            favoriteIDs.insert(entry.id)
        }
    }

    func isFavorite(_ entry: GuideEntry) -> Bool {
        favoriteIDs.contains(entry.id)
    }

    var favoriteEntries: [GuideEntry] {
        entries.filter { favoriteIDs.contains($0.id) }
    }

    // MARK: - Persona

    var selectedPersona: Persona? {
        personas.first { $0.id == selectedPersonaID }
    }

    /// Keeps the order the persona listed its apps in, and silently drops unknown ids.
    func essentialEntries(for persona: Persona) -> [GuideEntry] {
        let byID = Dictionary(entries.map { ($0.id, $0) }, uniquingKeysWith: { first, _ in first })
        return persona.essentialAppIds.compactMap { byID[$0] }
    }

    func stepKey(_ persona: Persona, _ index: Int) -> String {
        "\(persona.id)#\(index)"
    }

    func isStepDone(_ persona: Persona, _ index: Int) -> Bool {
        doneStepKeys.contains(stepKey(persona, index))
    }

    func toggleStep(_ persona: Persona, _ index: Int) {
        let key = stepKey(persona, index)
        if doneStepKeys.contains(key) {
            doneStepKeys.remove(key)
        } else {
            doneStepKeys.insert(key)
        }
    }

    func doneStepCount(_ persona: Persona) -> Int {
        persona.steps.indices.filter { isStepDone(persona, $0) }.count
    }

    // MARK: - Browsing

    var filteredEntries: [GuideEntry] {
        entries.filter { entry in
            let matchesCategory = selectedCategory == nil || entry.category == selectedCategory?.rawValue
            let matchesSearch = searchText.isEmpty
                || entry.name.localizedCaseInsensitiveContains(searchText)
                || entry.oneLiner.localizedCaseInsensitiveContains(searchText)
                || entry.tags.contains { $0.localizedCaseInsensitiveContains(searchText) }
            return matchesCategory && matchesSearch
        }
    }

    func groupedByCategory() -> [(category: GuideCategory, entries: [GuideEntry])] {
        GuideCategory.allCases.compactMap { category in
            let items = filteredEntries.filter { $0.category == category.rawValue }
            return items.isEmpty ? nil : (category, items)
        }
    }
}
