import Foundation

struct GuideEntry: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let category: String
    let oneLiner: String
    let whyNeeded: String
    let tags: [String]
    let appStoreId: String

    var appStoreURL: URL {
        URL(string: "https://apps.apple.com/hk/app/id\(appStoreId)")!
    }
}
