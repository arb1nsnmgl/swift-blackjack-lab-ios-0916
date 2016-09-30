//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Arvin San Miguel on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Player {
    
    let name: String
    var cards: [Card]
    var handscore: UInt { return calculateScore() }
    var blackjack: Bool { return handscore == 21 && cards.count == 2 }
    var busted: Bool { return handscore > 21 }
    var mayHit: Bool { return busted == blackjack && stayed || handscore < 21 }
    var stayed = false
    var tokens: UInt
    var description: String { return details() }
    
    init(name: String) {
        self.name = name
        self.tokens = 100
        self.cards = []
    }
    
    private func details() -> String {
        return "Player name: \(name)\nCards in hand: \(cards)\nHandScore: \(handscore)\nBlackJack: \(blackjack)\nBusted: \(busted)\nStayed: \(stayed)\nTokens: \(tokens)"
    }
    
    
    private func calculateScore() -> UInt {
        var acesInHand = [Card]()
        var total: UInt = 0
        for card in self.cards {
            if card.rank == "A" {
                acesInHand.append(card)
            }
            total += card.cardValue
        }
        
        if total <= 11 && acesInHand.count > 0 {
            total += 10
        }
        
        return total
      
    }
    
    func canPlaceBet(_ amount: UInt) -> Bool { return tokens >= amount }
    
    func didWin(_ win: UInt) { tokens += win }
    
    func didLose(_ lose: UInt) { tokens -= lose }
    
}
