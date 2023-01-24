/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.front)
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
//            Spacer()
//            HStack {
//                Label("\(card.attendees.count)", systemImage: "person.2")
//                    .accessibilityLabel("\(card.attendees.count) attendees")
//                Spacer()
//                Label("\(card.lengthInMinutes)", systemImage: "clock")
//                    .accessibilityLabel("\(card.lengthInMinutes) minute meeting")
//                    .labelStyle(.trailingIcon)
//            }
//            .font(.caption)
        }
        .padding()
//        .foregroundColor(card.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var card = Card.sampleData[1]
    static var previews: some View {
        CardView(card: card)
//            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
