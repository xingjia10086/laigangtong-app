import Foundation

@MainActor
final class GuideStore: ObservableObject {
    @Published private(set) var entries: [GuideEntry] = []
    @Published var favoriteIDs: Set<String> {
        didSet { saveFavorites() }
    }
    @Published var searchText: String = ""
    @Published var selectedCategory: GuideCategory?

    private let favoritesKey = "favoriteEntryIDs"

    init() {
        favoriteIDs = Set(UserDefaults.standard.stringArray(forKey: favoritesKey) ?? [])
        loadEntries()
    }

    private func loadEntries() {
        guard let url = Bundle.main.url(forResource: "apps", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        entries = (try? JSONDecoder().decode([GuideEntry].self, from: data)) ?? []
    }

    private func saveFavorites() {
        UserDefaults.standard.set(Array(favoriteIDs), forKey: favoritesKey)
    }

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
