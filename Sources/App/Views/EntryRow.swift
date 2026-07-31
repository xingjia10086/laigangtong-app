import SwiftUI

struct EntryRow: View {
    let entry: GuideEntry
    @ObservedObject var store: GuideStore
    @State private var showDetail = false

    var body: some View {
        Button {
            showDetail = true
        } label: {
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(entry.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(entry.oneLiner)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button {
                    store.toggleFavorite(entry)
                } label: {
                    Image(systemName: store.isFavorite(entry) ? "star.fill" : "star")
                        .foregroundStyle(store.isFavorite(entry) ? .yellow : .secondary)
                }
                .buttonStyle(.plain)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showDetail) {
            EntryDetailView(entry: entry, store: store)
        }
    }
}
