import SwiftUI

struct PersonaView: View {
    @ObservedObject var store: GuideStore

    var body: some View {
        NavigationStack {
            Group {
                if let persona = store.selectedPersona {
                    detail(persona)
                } else {
                    picker
                }
            }
            .navigationTitle("為我推薦")
        }
    }

    private var picker: some View {
        List {
            Section {
                ForEach(store.personas) { persona in
                    Button {
                        store.selectedPersonaID = persona.id
                    } label: {
                        HStack(spacing: 14) {
                            Image(systemName: persona.symbol)
                                .font(.title2)
                                .foregroundStyle(.tint)
                                .frame(width: 34)
                            VStack(alignment: .leading, spacing: 3) {
                                Text(persona.name)
                                    .font(.headline)
                                    .foregroundStyle(.primary)
                                Text(persona.subtitle)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.footnote)
                                .foregroundStyle(.tertiary)
                        }
                        .padding(.vertical, 4)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("你是以哪種身份來港？")
            } footer: {
                Text("選好之後會列出你最先要辦的事，以及對應要裝的 App。之後可以隨時更改。")
            }
        }
    }

    private func detail(_ persona: Persona) -> some View {
        List {
            Section {
                Text(persona.summary)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } header: {
                Label("\(persona.name) · \(persona.subtitle)", systemImage: persona.symbol)
            }

            Section {
                ForEach(persona.steps.indices, id: \.self) { index in
                    Button {
                        store.toggleStep(persona, index)
                    } label: {
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: store.isStepDone(persona, index)
                                  ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(store.isStepDone(persona, index) ? .green : .secondary)
                            Text(persona.steps[index])
                                .foregroundStyle(store.isStepDone(persona, index) ? .secondary : .primary)
                                .strikethrough(store.isStepDone(persona, index))
                            Spacer(minLength: 0)
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                HStack {
                    Text("落地後要辦的事")
                    Spacer()
                    Text("\(store.doneStepCount(persona))/\(persona.steps.count)")
                }
            }

            Section("優先安裝") {
                ForEach(store.essentialEntries(for: persona)) { entry in
                    EntryRow(entry: entry, store: store)
                }
            }

            Section {
                Button("更改身份") {
                    store.selectedPersonaID = nil
                }
            }
        }
    }
}
