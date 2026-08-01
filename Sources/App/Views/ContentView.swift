import SwiftUI

struct ContentView: View {
    @ObservedObject var store: GuideStore

    var body: some View {
        NavigationStack {
            List {
                ForEach(store.groupedByCategory(), id: \.category) { group in
                    Section {
                        ForEach(group.entries) { entry in
                            EntryRow(entry: entry, store: store)
                        }
                    } header: {
                        Label(group.category.rawValue, systemImage: group.category.symbol)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("全部指南")
            .searchable(text: $store.searchText, prompt: "搜尋 App 或分類")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("全部分類") { store.selectedCategory = nil }
                        ForEach(GuideCategory.allCases) { category in
                            Button(category.rawValue) { store.selectedCategory = category }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
            .overlay {
                if store.filteredEntries.isEmpty {
                    ContentUnavailableView("沒有符合的 App", systemImage: "magnifyingglass")
                }
            }
        }
    }
}

#Preview {
    ContentView(store: GuideStore())
}
