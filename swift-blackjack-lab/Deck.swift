//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Arvin San Miguel on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import GameKit


class Deck {
    
    private var dealtCards = [Card]()
    private var undealtCards = [Card]()
    var description: String { return "Cards Remaining: \(undealtCards.count)\nCards Dealt: \(dealtCards.count)" }
    
    init() {
        
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                undealtCards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    
    func drawCard() -> Card {
        let card = undealtCards.removeFirst()
        dealtCards.append(card)
        return card
    }
    
    func shuffle() {
        let shuffle = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: undealtCards)
        undealtCards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: shuffle) as! [Card]
    }
}
