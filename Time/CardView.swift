/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct CardView: View {
    let scrum: Today
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.mood)
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
//            Spacer()
//            HStack {
//                Label("\(scrum.attendees.count)", systemImage: "person.3")
//                    .accessibilityLabel("\(scrum.attendees.count) attendees")
//                Spacer()
//                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
//                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
//                    .labelStyle(.trailingIcon)
//            }
//            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = Today.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
