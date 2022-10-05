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
}

func hoursSpentOn(_categories: [String], _hoursSpent: [Double]) -> timeSpent {
    var timeSpentOn: timeSpent = timeSpent(categories: [], hoursSpent: [])
    
    let len: Int = _categories.count - 1
    var sum: Double = 0
    for idx in 0...len {
        timeSpentOn.categories.append(_categories[idx])
        timeSpentOn.hoursSpent.append(_hoursSpent[idx])
        sum += _hoursSpent[idx]
    }

    if sum < 24 {
        let freeTime = 24 - sum
        timeSpentOn.categories.append("Free")
        timeSpentOn.hoursSpent.append(freeTime)
    }
    
    return timeSpentOn
}

func getDayFromDate(date: Date) -> String {
    let dateformat = DateFormatter()
    dateformat.dateFormat = "EEEE"
    return dateformat.string(from: date)
}
