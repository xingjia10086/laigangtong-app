import SwiftUI

struct EntryDetailView: View {
    let entry: GuideEntry
    @ObservedObject var store: GuideStore
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(entry.oneLiner)
                        .font(.title3)
                        .fontWeight(.semibold)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("新來港人士為什麼需要它")
                            .font(.headline)
                        Text(entry.whyNeeded)
                            .foregroundStyle(.secondary)
                    }

                    if !entry.tags.isEmpty {
                        FlowLayout(spacing: 8) {
                            ForEach(entry.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(.thinMaterial, in: Capsule())
                            }
                        }
                    }

                    Link(destination: entry.appStoreURL) {
                        Label("在 App Store 開啟", systemImage: "arrow.up.right.square")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle(entry.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("關閉") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        store.toggleFavorite(entry)
                    } label: {
                        Image(systemName: store.isFavorite(entry) ? "star.fill" : "star")
                    }
                }
            }
        }
    }
}
