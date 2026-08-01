import Foundation

struct Persona: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let subtitle: String
    let symbol: String
    let summary: String
    let steps: [String]
    let essentialAppIds: [String]
}
