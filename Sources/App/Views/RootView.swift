import SwiftUI

struct RootView: View {
    @StateObject private var store = GuideStore()

    var body: some View {
        TabView(selection: $store.selectedTab) {
            PersonaView(store: store)
                .tabItem { Label("為我推薦", systemImage: "person.crop.circle") }
                .tag(0)

            ContentView(store: store)
                .tabItem { Label("全部指南", systemImage: "square.grid.2x2") }
                .tag(1)

            FavoritesView(store: store)
                .tabItem { Label("收藏", systemImage: "star") }
                .tag(2)
        }
    }
}

#Preview {
    RootView()
}
