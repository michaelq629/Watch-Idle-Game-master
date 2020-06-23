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
    var positionsArray : [Position] = []
    var upgradeLevel : Int = 0
    var justPurchased:Bool = true
    var gambleTableViewIndex: Int = 0
    var gambleTableViewDeletedCells : [Int] = []

    class var sharedInstance: SharedData {
        struct Singleton { static let instance = SharedData() }
        return Singleton.instance
    }
    
    
    private init() {
        let gamble1 = Gamble.init(name: "Sell broom from work", image: "broom", profitPossibility: 75, winOrLossText: ["Wow, you won", "Wow, you lost"], profitOrLossAmount: [500,-100] )
         let gamble2 = Gamble.init(name: "Gamble in the casino", image: "casino", profitPossibility: 20, winOrLossText: ["Wow, you won", "Wow, you lost"], profitOrLossAmount: [200,-1000] )
        
       
        
        
        let janitor = Position.init(name: "Janitor", image: "janitor", upgradeButtonText: "Warehouse", upgradeButtonImage: "warehouseUpgrade", upgradeButtonCostText: "$500", gambles: [gamble1, gamble2] ,  earningRate: 10, earningQuad: [0.025, 0.050, 0.075, 0.01])
        
        
        
        let warehouse = Position.init(name: "Janitor", image: "janitor", upgradeButtonText: "Warehouse", upgradeButtonImage: "warehouseUpgrade", upgradeButtonCostText: "$500", gambles: [gamble1] ,  earningRate: 100, earningQuad: [0.25, 0.50, 0.75, 0.1])
        positionsArray.append(janitor)
          positionsArray.append(warehouse)
        print(positionsArray)
    }
    
}
