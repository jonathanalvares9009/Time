//
//  Day.swift
//  Time
//
//  Created by JONATHAN ALVARES on 05/10/22.
//

import Foundation

struct DateData: Identifiable {
    let id: UUID
    var date: Date
    var freeTime: Int
    
    init(id: UUID = UUID(), date: Date, freeTime: Int) {
        self.id = id
        self.date = date
        self.freeTime = freeTime
    }
}

extension DateData {
    static let sampleData: [DateData] =
    [
        DateData(date: Date(), freeTime: 12),
        DateData(date: Date(), freeTime: 10),
        DateData(date: Date(), freeTime: 2),
    ]
}
