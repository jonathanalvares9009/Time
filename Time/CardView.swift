/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct CardView: View {
    let today: Today
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(today.formattedDate)")
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(today.mood.rawValue.capitalized)", systemImage: "face.smiling")
                    .accessibilityLabel("Mood today")
                Spacer()
                Label("\(Int(today.totalHours)) hours", systemImage: "clock")
                    .accessibilityLabel("Time spent doing something")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(today.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var today = Today.sampleData[0]
    static var previews: some View {
        CardView(today: today)
            .background(today.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
