//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    /**
     
     * Declare any custom properties here.
     
     */
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /*
         
         * Call your custom classes here when running the scheme.
         
         */
        
        // Do not alter
        return true  //
    }   ///////////////
    
    /*
     
     * Write your playBlackjack method in here
     
     */
    
    
    
    func playBlackjack(withBet: Int) {
        
        let dealer = Dealer()
        
        let bet: UInt = 0
        
        dealer.deal()
            
        while dealer.winner() == "no" && dealer.placeBet(bet) {
        
            dealer.turn(dealer.player)
            dealer.turn(dealer.house)
        }
        
        print(dealer.award())
        
    }
    


}

