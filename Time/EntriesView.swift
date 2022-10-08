/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct EntriesView: View {
    @Binding var entries: [Today]
    @State private var isPresentingNewEntryView = false
    @State private var newEntryData = Today.Data()
    
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
                            newEntryData = Today.Data()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            let newEntry = Today(data: newEntryData)
                            entries.append(newEntry)
                            isPresentingNewEntryView = false
                            newEntryData = Today.Data()
                        }
                    }
                }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EntriesView(entries: .constant(Today.sampleData))
        }
    }
}

