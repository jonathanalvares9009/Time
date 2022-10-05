/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct Time: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EntriesView(entries: Today.sampleData)
            }
        }
    }
}
