//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Arvin San Miguel on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Dealer {
    
    let deck = Deck()
    let house = House(name: "House")
    let player = House(name: "Player")
    var bet: UInt = 0
    
    func placeBet(_ amount: UInt) -> Bool {
        
        if house.canPlaceBet(amount) && player.canPlaceBet(amount) {
            bet = amount
            return true
        } else {
            return false
        }
    }
    
    func deal() {
        if !player.stayed && !house.stayed {
            deck.shuffle()
            for _ in 1...2 { player.cards.append(deck.drawCard()) }
            for _ in 1...2 { house.cards.append(deck.drawCard()) }
        }
    }
    
    func turn(_ player: House) {
        if !player.busted {
            if player.mayHit {
                player.cards.append(deck.drawCard())
            } else {
                player.stayed = true
            }
        }
    }
    
    func winner() -> String {
        if player.blackjack || house.busted {
            player.cards = []
            house.cards = []
            return "player"
        } else if house.blackjack || player.busted || player.blackjack && house.blackjack {
            player.cards = []
            house.cards = []
            return "house"
        } else {
            return "no"
        }
        
    }
    
    func award() -> String {
        let winnerOfTheRound = winner()
        if winner() == player.name {
            player.tokens += bet
            house.tokens -= (bet / 2)
        } else if winner() == house.name {
            house.tokens += bet
            player.tokens -= (bet / 2)
        }
        
    return "The winner of the round is \(winnerOfTheRound)."
        
    }
    
    
    
}
