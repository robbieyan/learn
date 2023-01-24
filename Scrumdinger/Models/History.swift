/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [Card.Attendee]
    var lengthInMinutes: Int

    init(id: UUID = UUID(), date: Date = Date(), attendees: [Card.Attendee], lengthInMinutes: Int = 5) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}
