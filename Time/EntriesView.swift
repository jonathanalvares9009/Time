/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct EntriesView: View {
    @Binding var entries: [Entry]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewEntryView = false
    @State private var newEntryData = Entry.Data()
    let saveAction: ()->Void
    
    var body: some View {
        List {
            ForEach($entries) { $entry in
                NavigationLink(destination: DetailView(today: $entry)) {
                    CardView(today: entry)
                }
                .listRowBackground(entry.theme.mainColor)
            }
        }
        .navigationTitle("Entries")
        .toolbar {
            Button(action: {
                isPresentingNewEntryView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("Add New Entry")
        }
        .sheet(isPresented: $isPresentingNewEntryView) {
            NavigationView {
                DetailEditView(data: $newEntryData)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewEntryView = false
                            newEntryData = Entry.Data()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            let newEntry = Entry(data: newEntryData)
                            entries.append(newEntry)
                            isPresentingNewEntryView = false
                            newEntryData = Entry.Data()
                        }
                    }
                }
            }
        }.onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EntriesView(entries: .constant(Entry.sampleData), saveAction: {})
        }
    }
}

