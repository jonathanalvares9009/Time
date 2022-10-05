/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct EntriesView: View {
    var entries: [Today]
    
    var body: some View {
        List {
            ForEach(entries) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Entries")
        .toolbar {
            Button(action: {print("Button Clicked")}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Entry")
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

