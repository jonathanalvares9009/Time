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
    var categories: [Category]
    var theme: Theme
    var totalHours: Double = 2
    
    init(id: UUID = UUID(), date: Date = Date(), mood: Mood, note: String, values: [Double], categories: [Category], theme: Theme = Mood.amazing.themeColor, totalHours: Double) {
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
        let id: UUID = UUID()
        let date: Date = Date()
        var formattedDate: String = ""
        var mood: Mood = Mood.amazing
        var note: String = ""
        var values: [Double] = []
        var categories: [Category] = []
        var theme: Theme = Mood.amazing.themeColor
        var totalHours: Double = 0
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
        print(data)
        self.id = data.id
        self.date = data.date
        self.mood = data.mood
        self.note = data.note
        self.values = data.values
        self.categories = data.categories
        self.theme = data.theme
        self.formattedDate = getFormattedDate(date: data.date)
        self.totalHours = 0
        for value in self.values {
            self.totalHours += value
        }
    }
}

extension Today {
    static let sampleData: [Today] =
    [
        Today(mood: Mood.amazing, note: "I love Goa", values: [1, 2, 3, 4], categories: [Category.sleep, Category.play, Category.mobile, Category.mobile], totalHours: 10),
        Today(mood: Mood.good, note: "I love Goa", values: [6, 2, 3, 4], categories: [Category.sleep, Category.play, Category.mobile, Category.mobile], totalHours: 15),
        Today(mood: Mood.fine, note: "I love Goa", values: [1, 5, 3, 4], categories: [Category.sleep, Category.play, Category.mobile, Category.mobile], totalHours: 13)
    ]
}
