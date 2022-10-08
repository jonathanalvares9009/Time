/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct Time: App {
    @State private var entries = Entry.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EntriesView(entries: $entries)
            }
        }
    }
}
