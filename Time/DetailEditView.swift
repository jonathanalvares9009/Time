/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct DetailEditView: View {
    @Binding var data: Today.Data
    @State private var newCategoryName = Category.random
    @State private var newCategoryValue = ""
    
    var body: some View {
        Form {
            Section(header: Text("Mood Today")) {
                Picker("Mood", selection: $data.mood) {
                    ForEach(Mood.allCases) { mood in
                        Text(mood.rawValue.capitalized).tag(mood)
                    }
                }
            }
            Section(header: Text("Note for future me")) {
                TextField("Write a note", text: $data.note)
            }
            Section(header: Text("Categories ")) {
                ForEach(data.categories) { category in
                    Text(category.name)
                }.onDelete { indices in
                    data.categories.remove(atOffsets: indices)
                }
                HStack {
                    Picker("Category", selection: $newCategoryName) {
                        ForEach(Category.allCases) { category in
                            if category != Category.free_time {
                                Text(category.name).tag(category)
                            }
                        }
                    }
                    .onChange(of: newCategoryName) { tag in
                        let category = newCategoryName
                        data.categories.append(category)
                    }
                }
            }
            Section(header: Text("Time spent on categories")) {
                ForEach(data.values) { value in
                    Text("\(hoursInStringFormat(val: value))")
                }.onDelete { indices in
                    data.values.remove(atOffsets: indices)
                }
                HStack {
                    TextField("1", text: $newCategoryValue)
                    Button(action: {
                        withAnimation {
                            let value = Double(newCategoryValue)
                            data.values.append(value ?? 0)
                            newCategoryValue = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newCategoryValue.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Today.sampleData[0].data))
    }
}
