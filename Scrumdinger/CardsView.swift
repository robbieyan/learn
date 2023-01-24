/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct CardsView: View {
    @Binding var cards: [Card]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewCardView = false
    @State private var newCardData = Card.Data()
    let saveAction: ()->Void
    
    var body: some View {
        List {
            ForEach($cards) { $card in
                NavigationLink(destination: DetailView(card: $card)) {
                    CardView(card: card)
                }
//                .onDisappear {
//                    card.index = card.index + 1
//                }
//                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Cards")
        .toolbar {
            Button(action: {
                isPresentingNewCardView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New card")
        }
        .sheet(isPresented: $isPresentingNewCardView) {
            NavigationView {
                DetailEditView(data: $newCardData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewCardView = false
                                newCardData = Card.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newScrum = Card(data: newCardData)
                                cards.append(newScrum)
                                isPresentingNewCardView = false
                                newCardData = Card.Data()
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardsView(cards: .constant(Card.sampleData), saveAction: {})
        }
    }
}

