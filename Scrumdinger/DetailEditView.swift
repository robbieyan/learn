/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct DetailEditView: View {
    @Binding var data: Card.Data
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Front")) {
                TextEditor(text: $data.front)
//                HStack {
//                    Slider(value: $data.back, in: 5...30, step: 1) {
//                        Text("Length")
//                    }
//                    .accessibilityValue("\(Int(data.back)) minutes")
//                    Spacer()
//                    Text("\(Int(data.back)) minutes")
//                        .accessibilityHidden(true)
//                }
//                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Back")) {
                TextEditor(text: $data.back)
//                ForEach(data.attendees) { attendee in
//                    Text(attendee.name)
//                }
//                .onDelete { indices in
//                    data.attendees.remove(atOffsets: indices)
//                }
//                HStack {
//                    TextField("New Attendee", text: $newAttendeeName)
//                    Button(action: {
//                        withAnimation {
//                            let attendee = Card.Attendee(name: newAttendeeName)
//                            data.attendees.append(attendee)
//                            newAttendeeName = ""
//                        }
//                    }) {
//                        Image(systemName: "plus.circle.fill")
//                            .accessibilityLabel("Add attendee")
//                    }
//                    .disabled(newAttendeeName.isEmpty)
//                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Card.sampleData[1].data))
    }
}
