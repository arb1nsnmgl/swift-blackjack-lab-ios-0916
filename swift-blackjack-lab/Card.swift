//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Arvin San Miguel on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Card {
    
    let suit: String
    let rank: String
    var description: String { return cardLabel }
    var cardLabel: String { return "\(suit)\(rank)" }
    var cardValue: UInt {
        
        switch rank {
        case "A": return UInt(1)
        case "K", "Q", "J": return UInt(10)
        default : return UInt(self.rank)!
        
        }
        
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
    
   class func validSuits() -> [String] {
        return ["♣︎", "♥︎", "♦︎", "♠︎"]
    }
    
   class func validRanks() -> [String] {
        return ["K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2", "A"]
    }
        
}
