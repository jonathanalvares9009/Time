/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct Today: Identifiable, Codable {
    let id: UUID
    let date: Date
    var mood: String
    var note: String
    var values: [Double]
    var categories: [String]
    var theme: Theme
    
    init(id: UUID = UUID(), date: Date = Date(), mood: String, note: String, values: [Double], categories: [String], theme: Theme = .seafoam) {
        self.id = id
        self.date = date
        self.mood = mood
        self.note = note
        self.values = values
        self.categories = categories
        self.theme = theme
    }
}

extension Today {
    struct Data {
        var mood: String = ""
        var note: String = ""
        var values: [Double] = []
        var categories: [String] = []
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(mood: mood, note: note, values: values, categories: categories, theme: theme)
    }
    
    mutating func update(from data: Data) {
        mood = data.mood
        note = data.note
        values = data.values
        categories = data.categories
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        date = Date()
        mood = data.mood
        note = data.note
        values = data.values
        categories = data.categories
        theme = data.theme
    }
}

extension Today {
    static let sampleData: [Today] =
    [
        Today(mood: "Happy", note: "I love Goa", values: [1, 2, 3, 4], categories: ["Sleep", "Play", "Mobile", "Random"]),
        Today(mood: "Happy", note: "I love Goa", values: [1, 2, 3, 4], categories: ["Sleep", "Play", "Mobile", "Random"]),
        Today(mood: "Happy", note: "I love Goa", values: [1, 2, 3, 4], categories: ["Sleep", "Play", "Mobile", "Random"])
    ]
}
