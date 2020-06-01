//
//  InterfaceController.swift
//  Watch Idle Game WatchKit Extension
//
//  Created by Michael Que on 4/30/20.
//  Copyright © 2020 Michael Que. All rights reserved.
//

import WatchKit
import Foundation

//Make rotationalDelta .25

class InterfaceController: WKInterfaceController, WKCrownDelegate {
    @IBOutlet weak var moneyAmount: WKInterfaceLabel!
    @IBOutlet weak var moneyImage: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        moneyAmount.setText("$0")
        crownSequencer.delegate = self
        
    }
    

    
    let janitor = Position.init(name: "Janitor", image: "janitor", upgradeButtonText: "Warehouse", upgradeButtonImage: "warehouseUpgrade", upgradeButtonCostText: "$500", earningRate: 10, earningQuad: [0.025, 0.050, 0.075, 0.01])
    
    
    
   
    
    
    
    
    var gameRunning:Bool = true
    var totalBalance:Double = 0
    var earningRate : Double = 0.0
    var earnings:Double = 0
    var earningQuad:[Double] = []

    struct rotationalDelta {
        static var amount:Double = 0
    }
    
    var upgradeLevel : Int = 0
    
    
    
    
    var threshold = 0.0
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        
        if upgradeLevel == 0 {
            earningQuad = janitor.earningQuad
            earningRate = janitor.earningRate
            
        }
        
     
        if rotationalDelta < earningQuad[0]  {
            earnings = earningQuad[0]}
        else if rotationalDelta < earningQuad[1] {
            earnings = earningQuad[1]
        }
        else if rotationalDelta < earningQuad[2] {
            earnings = earningQuad[2]
        }
        else if rotationalDelta < earningQuad[3] {
            earnings = earningQuad[3]
        }
          if threshold >= earningRate  {
                moneyAnimate()
                threshold = 0
                print("Threshold has been resetted")
        //        print("threshold after if statement is", threshold)
                }
        print("Earnings is \(earnings)")
        totalBalance += earnings
        totalBalance = round(1000.0 * totalBalance) / 1000.0
        print("total ever rotated is", totalBalance)
        threshold += earnings
        threshold = round(1000.0 * threshold) / 1000.0
//        print("totalBalance is", totalBalance)
        print("threshold is", threshold)
        let formattedValue = String(format: "%0.2f", totalBalance)
        totalBalance = Double(formattedValue)!
        moneyAmount.setText("$" +  String(totalBalance))
        TotalMoney.init(money: totalBalance)
        
    }

    
    func moneyAnimate () {
        
        self.moneyImage.setHidden(false)
        animate(withDuration: 0.2, animations: {
            self.moneyImage.setHidden(false)
            self.moneyImage.setVerticalAlignment(.top)
        })
        let secondsToDelay = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            self.moneyImage.setHidden(true)
            
            self.animate(withDuration: 0.1, animations: {
                self.moneyImage.setVerticalAlignment(.bottom)
                WKInterfaceDevice().play(.notification)
            })
        }
        
    }
    


   
        
    @IBAction func pushScene() {
    pushController(withName: "UpgradeInterfaceController", context: nil)
    }

        
    
    
    
 


    
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    override func didAppear() {
        crownSequencer.focus()
    }
    
}
