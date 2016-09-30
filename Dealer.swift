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
        player.stayed = false; player.cards = []
        house.stayed = false; house.cards = []
        deck.shuffle()
        player.cards.append(deck.drawCard()) ; house.cards.append(deck.drawCard())
        player.cards.append(deck.drawCard()) ; house.cards.append(deck.drawCard())

    }
    
    func turn(_ player: House) {
        if player.mayHit {
            if player.mustHit {
                player.cards.append(deck.drawCard())
            } else {
                player.stayed = true
            }
        }
    }
    
    func winner() -> String {
        
        if house.busted || player.blackjack || player.cards.count == 5 && !player.busted {
            return "player"
        } else if player.busted || house.blackjack || house.cards.count == 5 && !house.busted {
            return "house"
        } else if house.stayed && player.stayed {
            if house.handscore >= player.handscore { return "house" } else { return "player" }
        } else { return "no" }
        
    }
    
    
    func award() -> String {
        let winnerOfTheRound = winner()
        if winner() == "player" {
            player.didWin(bet)
            house.didLose(bet)
        } else if winner() == "house" {
            house.didWin(bet)
            player.didLose(bet)
        } else {
            return "No winner."
        }
        
    return "\(winnerOfTheRound) wins."
        
    }
    
    
    
}
