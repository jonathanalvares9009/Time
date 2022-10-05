//
//  DaysView.swift
//  Time
//
//  Created by JONATHAN ALVARES on 05/10/22.
//

import SwiftUI

struct Day: Identifiable {
    var id: UUID = UUID()
    var day: String
}

struct DaysView: View {
    var days: [Day]
    
    var body: some View {
        List {
            ForEach(days) { day in
                Text(day.day)
            }
        }
        .listRowBackground(Color.orange)
        .navigationTitle("Time Spent On")
        
    }
}

func getDays() -> [Day] {
    var days: [Day] = []
    days.append(Day(day: "Monday"))
    days.append(Day(day: "Tuesday"))
    days.append(Day(day: "Wednesday"))
    return days
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        
        DaysView(days: getDays())
    }
}
