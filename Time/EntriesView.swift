/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct EntriesView: View {
    var entries: [Today]
    
    var body: some View {
        List {
            ForEach(entries) { entry in
                NavigationLink(destination: DetailView(today: entry)) {
                    CardView(today: entry)
                }
                .listRowBackground(entry.theme.mainColor)
            }
        }
        .navigationTitle("Entries")
        .toolbar {
            Button(action: {print("Button Clicked")}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("Add New Entry")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EntriesView(entries: Today.sampleData)
        }
    }
}

