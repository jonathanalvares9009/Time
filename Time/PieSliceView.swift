//
//  DayView.swift
//  Time
//
//  Created by JONATHAN ALVARES on 04/10/22.
//

import SwiftUI
import Charts

struct ValuePerCategory {
    var category: String
    var value: Double
}

var data: [ValuePerCategory] = [
    .init(category: "Aqwerty", value: 5),
    .init(category: "B", value: 9),
    .init(category: "C", value: 7),
    .init(category: "D", value: 5),
    .init(category: "E", value: 9),
    .init(category: "F", value: 5),
    .init(category: "F", value: 9),
]

struct PieSliceView: View {
//    data.append(.init(category: "G", value: 10))
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        if #available(iOS 16.0, *) {
            Chart(data, id: \.category) { item in
                BarMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.value)
                )
            }
        } else {
            // Fallback on earlier versions
            Text("Upgrade to iOS 16")
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        PieSliceView()
    }
}
