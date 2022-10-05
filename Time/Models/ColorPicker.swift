//
//  ColorPicker.swift
//  Time
//
//  Created by JONATHAN ALVARES on 04/10/22.
//

import SwiftUI

var colors: [Color] = [
    Color.yellow,
    Color.blue,
    Color.green,
    Color.orange,
    Color.cyan,
    Color.brown,
    Color.purple
]

func colorsPicker(numOfCategories: Int) -> [Color] {
    var colorsPicked: [Color] = []
    for idx in 0...numOfCategories {
        colorsPicked.append(colors[idx])
    }
    return colorsPicked
}

func getColorForTheDay(day: String) -> Color {
    switch day {
        case "Monday": return Color.blue
        case "Tuesday": return Color.orange
        case "Wednesday": return Color.purple
        case "Thursday": return Color.cyan
        case "Friday": return Color.yellow
        case "Saturday": return Color.brown
        case "Sunday": return Color.green
        default: return Color.gray
    }
}
