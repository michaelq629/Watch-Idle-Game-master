//
//  gambleResult.swift
//  Watch Idle Game WatchKit Extension
//
//  Created by Michael Que on 6/18/20.
//  Copyright © 2020 Michael Que. All rights reserved.
//

import Foundation
import WatchKit


class gambleResult : WKInterfaceController {
var currentPosition : Position?
    @IBOutlet weak var winOrLossLabel: WKInterfaceLabel!
    @IBOutlet weak var moneyLossLabel: WKInterfaceLabel!
    
    
    func randomBoolWithYesPercentage(percentage:Int) -> Bool{
        return arc4random_uniform(100) < percentage;
    }


    override func awake(withContext context: Any?) {
        currentPosition = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel]
          if let currentPos = currentPosition {
          var PassOrFail : Bool = false
          PassOrFail = randomBoolWithYesPercentage(percentage: currentPos.gambles[SharedData.sharedInstance.gambleTableViewIndex].profitPossibility)
            if PassOrFail == true {
                winOrLossLabel.setText(currentPosition?.gambles[SharedData.sharedInstance.gambleTableViewIndex].winOrLossText[0])
                moneyLossLabel.setText("Therefore, you got " + String((currentPosition?.gambles[SharedData.sharedInstance.gambleTableViewIndex].profitOrLossAmount[0])!) + "dollars")
                SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney + Double((currentPosition?.gambles[SharedData.sharedInstance.gambleTableViewIndex].profitOrLossAmount[0])!)
                
            }
            
            else if PassOrFail == false {
                winOrLossLabel.setText(currentPosition?.gambles[SharedData.sharedInstance.gambleTableViewIndex].winOrLossText[1])
                               moneyLossLabel.setText("Therefore, you got " + String((currentPosition?.gambles[SharedData.sharedInstance.gambleTableViewIndex].profitOrLossAmount[1])!) + "dollars")
                
                 SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney + Double((currentPosition?.gambles[SharedData.sharedInstance.gambleTableViewIndex].profitOrLossAmount[1])!)
            }
            
    }
    
    
  


    



    
}

}
