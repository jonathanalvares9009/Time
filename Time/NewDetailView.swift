//
//  NewDetailView.swift
//  Time
//
//  Created by JONATHAN ALVARES on 07/10/22.
//

import SwiftUI

import SwiftUI

struct NewDetailView: View {
    @Binding var entries: [Today]
    @State private var entry: Today = Today()
    @State private var newCategoryName = ""
    @State private var newCategoryValue = ""
    
    var body: some View {
        Form {
            Section(header: Text("Mood Today")) {
                Picker("Mood", selection: $entry.mood) {
                    ForEach(Mood.allCases) { mood in
                        Text(mood.rawValue.capitalized).tag(mood)
                    }
                }
            }
            Section(header: Text("Note for future me")) {
                TextField("Write a note", text: $entry.note)
            }
            Section(header: Text("Categories ")) {
                ForEach(entry.categories, id: \.self) { category in
                    Text(category)
                }.onDelete { indices in
                    entry.categories.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Category", text: $newCategoryName)
                    Button(action: {
                        withAnimation {
                            let category = newCategoryName
                            entry.categories.append(category)
                            newCategoryName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newCategoryName.isEmpty)
                }
            }
            Section(header: Text("Time spent on categories")) {
                ForEach(entry.values, id: \.self) { value in
                    Text("\(hoursInStringFormat(val: value))")
                }.onDelete { indices in
                    entry.values.remove(atOffsets: indices)
                }
                HStack {
                    TextField("1", text: $newCategoryValue)
                    Button(action: {
                        withAnimation {
                            let value = Double(newCategoryValue)
                            entry.values.append(value ?? 0)
                            newCategoryValue = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newCategoryValue.isEmpty)
                }
            }
        }
        .toolbar {
            Button(action: {print("Button Clicked")}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("Add New Entry")
        }
    }
}

struct NewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewDetailView(entries: .constant(Today.sampleData))
    }
}
