/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct Time: App {
    @StateObject private var store = EntriesStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EntriesView(entries: $store.entries) {
                    EntriesStore.save(entries: store.entries) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }.onAppear {
                EntriesStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let entries):
                        store.entries = entries
                    }
                }
            }
        }
    }
}
