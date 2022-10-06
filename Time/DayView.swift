//
//  DayView.swift
//  Time
//
//  Created by JONATHAN ALVARES on 04/10/22.
//

import SwiftUI

struct DayView: View {
    var values: [Double]
    var categories: [String]
    var totalHours: Int
    
    var body: some View {
        VStack {
            Spacer().frame(height: 150.0)
            Text("Time spent today")
                .font(.headline)
                .foregroundColor(.white)
            PieChartView(
                values: values,
                names: categories,
                totalHours: totalHours,
                formatter: { val in
                    hoursInStringFormat(val: val)
                },
                colors: colorsPicker(numOfCategories: values.count)
            )
            .padding(7.0)
        }
        .background(Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        let timeSpentOn: timeSpent = hoursSpentOn(_categories: ["Rent", "Transport", "Education", "Computer"], _hoursSpent: [1, 2, 3, 4], totalHours: 10)
        DayView(values: timeSpentOn.hoursSpent, categories: timeSpentOn.categories, totalHours: timeSpentOn.totalHours)
    }
}
