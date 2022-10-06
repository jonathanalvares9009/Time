//
//  utility.swift
//  Time
//
//  Created by JONATHAN ALVARES on 04/10/22.
//

import Foundation

func hoursInStringFormat(val: Double) -> String {
    var hoursStringFormat: String = String(format: "%.0f", val)
    if val > 1.0 {
        hoursStringFormat += " hours"
    } else {
        hoursStringFormat += " hour"
    }
    return hoursStringFormat
}

struct timeSpent {
    var categories: [String]
    var hoursSpent: [Double]
    var totalHours: Double
}

func hoursSpentOn(_categories: [String], _hoursSpent: [Double], totalHours: Double) -> timeSpent {
    var timeSpentOn: timeSpent = timeSpent(categories: [], hoursSpent: [], totalHours: 2)
    
    timeSpentOn.totalHours = totalHours
    timeSpentOn.categories = _categories
    timeSpentOn.hoursSpent = _hoursSpent

    return timeSpentOn
}

func getDayFromDate(date: Date) -> String {
    let dateformat = DateFormatter()
    dateformat.dateFormat = "EEEE"
    return dateformat.string(from: date)
}
