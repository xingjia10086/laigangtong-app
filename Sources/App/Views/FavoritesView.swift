import SwiftUI

struct FavoritesView: View {
    @ObservedObject var store: GuideStore

    var body: some View {
        NavigationStack {
            List {
                ForEach(store.favoriteEntries) { entry in
                    EntryRow(entry: entry, store: store)
                }
            }
            .navigationTitle("我的收藏")
            .overlay {
                if store.favoriteEntries.isEmpty {
                    ContentUnavailableView(
                        "還未收藏任何 App",
                        systemImage: "star",
                        description: Text("在指南裡點右邊的星號，就會收藏到這裡。")
                    )
                }
            }
        }
    }
}
