//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Arvin San Miguel on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    var wallet: Double
    var mustHit: Bool { return self.handscore < 17 }
    
    
    override init(name: String) {
        self.wallet = 1000
        super.init(name: name)
    }
    
}
