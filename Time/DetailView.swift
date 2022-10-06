/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct DetailView: View {
    var today: Today
    let totalHoursInADay: Int = 24
    
    @State private var data = Today.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Time Spent On")) {
                NavigationLink(destination: DayView(values: today.values, categories: today.categories)) {
                    Label("Graphical Representation", systemImage: "chart.pie")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Productive Time", systemImage: "clock")
                    Spacer()
                    Text("\(today.totalHours) hours")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Free Time", systemImage: "clock")
                    Spacer()
                    Text("\(totalHoursInADay - today.totalHours) hours")
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("About Today")) {
                HStack {
                    Label("My Mood", systemImage: "face.smiling")
                    Spacer()
                    Text("\(today.mood)")
                }
                .accessibilityElement(children: .combine)
                Label("\(today.note)", systemImage: "note")
            }
        }
        .navigationTitle(today.formattedDate)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
//                data = scrum.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(today.mood)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
//                                scrum.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(today: Today.sampleData[0])
        }
    }
}
