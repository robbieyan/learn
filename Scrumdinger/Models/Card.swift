/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct Card: Identifiable, Codable {
    let id: UUID
    var front: String
    var attendees: [Attendee]
    var back: String
    var theme: Theme
    var history: [History] = []
    var index: Int = 0
    
    init(id: UUID = UUID(), title: String, attendees: [String], back: String, theme: Theme) {
        self.id = id
        self.front = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.back = back
        self.theme = theme
    }
}

extension Card {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var front: String = ""
        var attendees: [Attendee] = []
        var back: String = ""
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(front: front, attendees: attendees, back: back, theme: theme)
    }
    
    mutating func update(from data: Data) {
        front = data.front
        attendees = data.attendees
        back = data.back
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        front = data.front
        attendees = data.attendees
        back = data.back
        theme = data.theme
    }
}

extension Card {
    static let sampleData: [Card] =
    [
        Card(title: "Front1", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], back: "Back1", theme: .yellow),
        Card(title: "Front2", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], back: "Back2", theme: .orange),
        Card(title: "Front3", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], back: "Back3", theme: .poppy)
    ]
}
