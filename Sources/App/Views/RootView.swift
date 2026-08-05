import SwiftUI

struct RootView: View {
    @StateObject private var store = GuideStore()

    // Binding TabView's selection straight to the persisted value made tabs 1
    // and 2 render as a blank window on iOS 26 - no content, no navigation bar,
    // not even the tab bar - while tab 0 was fine. Start on the first tab so
    // the hierarchy is built with a selection that definitely resolves, then
    // restore the remembered tab once it exists.
    @State private var tab = 0

    var body: some View {
        TabView(selection: $tab) {
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
        .task {
            if store.selectedTab != tab {
                tab = store.selectedTab
            }
        }
        .onChange(of: tab) { _, newValue in
            store.selectedTab = newValue
        }
    }
}

#Preview {
    RootView()
}
