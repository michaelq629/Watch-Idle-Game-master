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
        moneyAmount.setText(String(SharedData.sharedInstance.totalMoney))
        crownSequencer.delegate = self
//        print(SharedData.sharedInstance.positionsArray[0])
        
    }
    

    @IBAction func upgradeButton() {
        
           
         pushController(withName: "UpgradeInterfaceController", context: nil)
    }
    
    
    
    
    
   
    
    
    
    
    var gameRunning:Bool = true
    var earningRate : Double = 0.0
    var earnings:Double = 0
    var earningQuad:[Double] = []

    struct rotationalDelta {
        static var amount:Double = 0
    }
    
 
    
    
    
    
    
    var threshold = 0.0
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        if SharedData.sharedInstance.upgradeLevel == 0 {
                           earningQuad = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningQuad
                           earningRate = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningRate
                           
                       }
        if SharedData.sharedInstance.upgradeLevel == 1 {
                                  earningQuad = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningQuad
                                  earningRate = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningRate
                                  
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
          
        
        
        print("Earnings is \(earnings)")
        SharedData.sharedInstance.totalMoney += earnings
        SharedData.sharedInstance.totalMoney = round(1000.0 * SharedData.sharedInstance.totalMoney) / 1000.0
        print("total ever rotated is", SharedData.sharedInstance.totalMoney)
        threshold += earnings
        threshold = round(1000.0 * threshold) / 1000.0
//        print("SharedData.sharedInstance.totalMoney is", SharedData.sharedInstance.totalMoney)
        print("threshold is", threshold)
        let formattedValue = String(format: "%0.2f", SharedData.sharedInstance.totalMoney)
        SharedData.sharedInstance.totalMoney = Double(formattedValue)!
        moneyAmount.setText("$" +  String(SharedData.sharedInstance.totalMoney))
       
    }

    
 
    


   

        
    
    
    
 


    
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if SharedData.sharedInstance.justPurchased == true {
                       moneyAmount.setText("$" +  String(SharedData.sharedInstance.totalMoney))
                       threshold = SharedData.sharedInstance.totalMoney
                   }
        
        
    
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    
    
                
    }
    override func didAppear() {
        crownSequencer.focus()
    }
    
}
