//
//  Card.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import Foundation

public struct Card: Hashable, Codable {
    var description: String
    var points: Int
    var answer: String
    var type: CardType
    
    init(_ description: String, _ answer: String, _ points: Int, _ type: CardType) {
        self.description = description
        self.answer = answer
        self.points = points
        self.type = type
    }
}
