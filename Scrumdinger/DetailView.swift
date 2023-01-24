/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct DetailView: View {
    @Binding var card: Card
    
    @State private var data = Card.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Front")) {
                TextEditor(text: $card.front)
//                NavigationLink(destination: MeetingView(scrum: $card)) {
//                    Label("Start Meeting", systemImage: "timer")
//                        .font(.headline)
//                        .foregroundColor(.accentColor)
//                }
//                HStack {
//                    Label("Length", systemImage: "clock")
//                    Spacer()
//                    Text("\(card.back) minutes")
//                }
//                .accessibilityElement(children: .combine)
//                HStack {
//                    Label("Theme", systemImage: "paintpalette")
//                    Spacer()
//                    Text(card.theme.name)
//                        .padding(4)
//                        .foregroundColor(card.theme.accentColor)
//                        .background(card.theme.mainColor)
//                        .cornerRadius(4)
//                }
//                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Back")) {
                TextEditor(text: $card.back)
//                ForEach(card.attendees) { attendee in
//                    Label(attendee.name, systemImage: "person")
//                }
            }
            Section(header: Text("Index")) {
                Text("\(card.index)")
//                ForEach(card.attendees) { attendee in
//                    Label(attendee.name, systemImage: "person")
//                }
            }
//            Section(header: Text("History")) {
//                if card.history.isEmpty {
//                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
//                }
//                ForEach(card.history) { history in
//                    HStack {
//                        Image(systemName: "calendar")
//                        Text(history.date, style: .date)
//                    }
//                }
//            }
        }
//        .navigationTitle(card.front)
//        .toolbar {
//            Button("Edit") {
//                isPresentingEditView = true
//                data = card.data
//            }
//        }
//        .sheet(isPresented: $isPresentingEditView) {
//            NavigationView {
//                DetailEditView(data: $data)
//                    .navigationTitle(card.front)
//                    .toolbar {
//                        ToolbarItem(placement: .cancellationAction) {
//                            Button("Cancel") {
//                                isPresentingEditView = false
//                            }
//                        }
//                        ToolbarItem(placement: .confirmationAction) {
//                            Button("Done") {
//                                isPresentingEditView = false
//                                card.update(from: data)
//                            }
//                        }
//                    }
//            }
//        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(card: .constant(Card.sampleData[0]))
        }
    }
}
