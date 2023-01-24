/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

//@main
//struct CardsApp: App {
//    @StateObject private var store = CardStore()
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                CardsView(cards: $store.scrums) {
//                    CardStore.save(scrums: store.scrums) { result in
//                        if case .failure(let error) = result {
//                            fatalError(error.localizedDescription)
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                CardStore.load { result in
//                    switch result {
//                    case .failure(let error):
//                        fatalError(error.localizedDescription)
//                    case .success(let scrums):
//                        store.scrums = scrums
//                    }
//                }
//            }
//        }
//    }
//}

//
//  FlashCards2.swift
//  FlashCards
//
//  Created by Xiang Yan on 2023/1/23.
//

//import SwiftUI

//struct ContentView: View {
//    @State private var linkClicked = false
//
//    var body: some View {
//        VStack {
//            if linkClicked {
//                NewView()
//            } else {
//                VStack {
//                    Text("Link not clicked yet")
//                    Button(action: {
//                        self.linkClicked = true
//                    }) {
//                        Text("Click here")
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct NewView: View {
//    var body: some View {
//        Text("You clicked the link!")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

@main
struct FlashCardsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
//                ContentView()
            }
        }
    }
}

struct HomeView: View {
    @State var cards: [FlashCard] =
    [
        FlashCard(question: "What is the capital of France?", answer: "Paris", familiarity: 1),
        FlashCard(question: "What is the largest planet in our solar system?", answer: "Jupyter", familiarity: 2),
        FlashCard(question: "What is the smallest country in the world?", answer: "Vatican City", familiarity: 0)
    ]

    
    var body: some View {
        NavigationView {
            VStack {
                //            NavigationLink(destination: NewView(linkClicked: linkClicked), isActive: $linkClicked) {
                //                Button(action: {
                //                    self.linkClicked = true
                //                }) {
                //                    Text("Click here")
                //                }
                //            }
                Button(action: {
                    self.cards.sort { $0.familiarity < $1.familiarity }                    }) {
                        Text("Sort")
                    }
                NavigationLink(destination: RunFlashCardsView(cards: self.$cards)) {
                    Text("Run")
                }
//                            .onTapGesture {
//                                print("sort")
//                                self.cards[0].familiarity = 100
                //                self.cards.sort { $0.familiarity < $1.familiarity }
//                            }
                NavigationLink(destination: CreateFlashCardView(cards: self.$cards)) {
                    Text("Create")
                }
            }
        }
    }
}

struct FlashCardPresentation: View {
    @State private var showAnswer = false
    @State private var isEditing = false
    @Binding var card: FlashCard
    let onSwipeRight: () -> Void
    let onSwipeLeft: () -> Void

    var body: some View {
        if self.isEditing {
            VStack {
                TextField("New question", text: $card.question)
                    .padding()
                TextField("New answer", text: $card.answer)
                    .padding()
                Button(action: {
                    self.isEditing = false
                }) {
                    Text("Done")
                }
            }
        } else {
            VStack {
                Text(showAnswer ? card.answer : card.question)
                    .font(.title)
                    .onTapGesture {
                        print("tap")
                        print("card.familiarity = \(card.familiarity)")
                        if !showAnswer {
                            card.familiarity = card.familiarity + 1
                        }
                        self.showAnswer.toggle()
                    }
                Button(action: {
                    self.isEditing = true
                }) {
                    Text("Edit")
                }
            }
            .gesture(
                DragGesture()
                    .onEnded {
                        if $0.translation.width > 1 {
                            self.onSwipeRight()
                        } else if $0.translation.width < -1 {
                            self.onSwipeLeft()
                        }
                    }
            )
        }
    }
}

struct CreateFlashCardView: View {
    @Binding var cards: [FlashCard]
    @State private var question = ""
    @State private var answer = ""

    var body: some View {
        VStack {
            TextField("Question", text: $question)
            TextField("Answer", text: $answer)
            Button(action: {
                self.cards.append(FlashCard(question: self.question, answer: self.answer, familiarity: 0))
                self.question = ""
                self.answer = ""
            }) {
                Text("Save")
            }
        }
    }
}

struct RunFlashCardsView: View {
    @Binding var cards: [FlashCard]

    @State private var currentCardIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                if currentCardIndex < self.cards.count {
                    FlashCardPresentation(card: $cards[currentCardIndex], onSwipeRight: {
                        print("swipe right")
                        print("self.currentCardIndex = \(self.currentCardIndex)")
                        self.currentCardIndex = (self.currentCardIndex + 1) % self.cards.count
                    }, onSwipeLeft: {
                        print("swipe left")
                        print("self.currentCardIndex = \(self.currentCardIndex)")
                        self.currentCardIndex = (self.currentCardIndex - 1 + self.cards.count) % self.cards.count
                    })
                } else {
                    Text("No more flash cards")
                }
            }
        }
    }
}

struct Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
