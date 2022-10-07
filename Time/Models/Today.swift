/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct Today: Identifiable {
    let id: UUID
    let date: Date
    var formattedDate: String = ""
    var mood: Mood
    var note: String
    var values: [Double]
    var categories: [String]
    var theme: Theme
    var totalHours: Double = 2
    
    init(id: UUID = UUID(), date: Date = Date(), mood: Mood, note: String, values: [Double], categories: [String], theme: Theme = Mood.amazing.themeColor, totalHours: Double) {
        self.id = id
        self.date = date
        self.mood = mood
        self.note = note
        self.values = values
        self.categories = categories
        self.theme = mood.themeColor
        self.formattedDate = getFormattedDate(date: self.date)
        self.totalHours = totalHours
    }
    
    func getFormattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
}

extension Today {
    struct Data {
        var mood: Mood = Mood.amazing
        var note: String = ""
        var values: [Double] = []
        var categories: [String] = []
        var theme: Theme = .seafoam
        var totalHours: Double = 2
    }
    
    var data: Data {
        Data(mood: mood, note: note, values: values, categories: categories, theme: theme, totalHours: totalHours)
    }
    
    mutating func update(from data: Data) {
        mood = data.mood
        note = data.note
        values = data.values
        categories = data.categories
        theme = data.mood.themeColor
        totalHours = 0
        for value in values {
            totalHours += value
        }
    }
    
    init(data: Data) {
        id = UUID()
        date = Date()
        mood = data.mood
        note = data.note
        values = data.values
        categories = data.categories
        theme = data.theme
        totalHours = data.totalHours
    }
}

extension Today {
    static let sampleData: [Today] =
    [
        Today(mood: Mood.amazing, note: "I love Goa", values: [1, 2, 3, 4], categories: ["Sleep", "Play", "Mobile", "Random"], totalHours: 10),
        Today(mood: Mood.good, note: "I love Goa", values: [6, 2, 3, 4], categories: ["Sleep", "Play", "Mobile", "Random"], totalHours: 15),
        Today(mood: Mood.fine, note: "I love Goa", values: [1, 5, 3, 4], categories: ["Sleep", "Play", "Mobile", "Random"], totalHours: 13)
    ]
}
