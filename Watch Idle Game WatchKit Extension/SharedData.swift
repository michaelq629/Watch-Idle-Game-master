//
//  Singleton.swift
//  Watch Idle Game WatchKit Extension
//
//  Created by Michael Que on 6/4/20.
//  Copyright © 2020 Michael Que. All rights reserved.
//

import Foundation

class SharedData {
    
    
    //    ["Sell broom from work", "Pickpocket CEO", "Pickpocket Salesman", "Gamble in the casino"]

    
    //    let janitorUpgradeImages = ["broom", "pickpocket", "pickpocket", "casino"]
    
    
    var totalMoney : Double = 0
    var currentPosition = 0
    var positionsArray : [Position] = []
    

    class var sharedInstance: SharedData {
        struct Singleton { static let instance = SharedData() }
        return Singleton.instance
    }
    
    
    private init() {
        let gamble1 = Gamble.init(name: "f", image: "g", riskAndRewardText: "hi", profitPossibility: 2)
        let janitor = Position.init(name: "Janitor", image: "janitor", upgradeButtonText: "Warehouse", upgradeButtonImage: "warehouseUpgrade", upgradeButtonCostText: "$500", gambles: [gamble1] ,  earningRate: 10, earningQuad: [0.025, 0.050, 0.075, 0.01])
        positionsArray.append(janitor)
        print(positionsArray)
    }
    
}
