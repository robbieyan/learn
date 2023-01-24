//
//  FlashCard.swift
//  Scrumdinger
//
//  Created by Xiang Yan on 2023/1/24.
//

import Foundation

struct FlashCard: Identifiable, Codable {
    let id: UUID
    var question: String
    var answer: String
    var familiarity: Int
    
    init(id: UUID = UUID(), question: String, answer: String, familiarity: Int) {
        self.id = id
        self.question = question
        self.answer = answer
        self.familiarity = familiarity
    }
}

