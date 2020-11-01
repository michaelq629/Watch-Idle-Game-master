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
    @IBOutlet weak var positionAvatar: WKInterfaceImage!
    @IBOutlet weak var positionLabel: WKInterfaceLabel!
    
        
    override func awake(withContext context: Any?) {
        
        super.awake(withContext: context)
   
        
//
        SharedData.sharedInstance.defaults = UserDefaults.standard
        
        SharedData.sharedInstance.totalMoney = (SharedData.sharedInstance.defaults?.double(forKey: "money"))!
        SharedData.sharedInstance.upgradeLevel = (SharedData.sharedInstance.defaults?.integer(forKey: "level"))!
    moneyAmount.setText(String(format: "%.2f", SharedData.sharedInstance.totalMoney))
        
        if !SharedData.sharedInstance.defaults!.bool(forKey: "didShowOnboarding") {
            let rootControllerIdentifier = "FirstInputInterfaceController"
            WKInterfaceController.reloadRootControllers(withNames: ["OnboardingFirstPage", "OnboardingSecondPage", "OnboardingThirdPage", "OnboardingFourthPage", "OnboardingFifthPage", "OnboardingSixthPage"], contexts: nil)
            
            SharedData.sharedInstance.defaults!.set(true, forKey: "didShowOnboarding")
        }
        
        
        
        crownSequencer.delegate = self
//        print(SharedData.sharedInstance.positionsArray[0])
        
      
        
    }
    

    @IBAction func upgradeButton() {
        
        WKInterfaceDevice.current().play(.click)
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
        
        if SharedData.sharedInstance.upgradeLevel == 2 {
            earningQuad = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningQuad
            earningRate = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningRate
            
        }
        
        if SharedData.sharedInstance.upgradeLevel == 3 {
            earningQuad = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningQuad
            earningRate = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningRate
            
        }
        
        if SharedData.sharedInstance.upgradeLevel == 4 {
            earningQuad = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningQuad
            earningRate = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningRate
            
        }
        
        if SharedData.sharedInstance.upgradeLevel == 5 {
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
        let defaults = UserDefaults.standard
        SharedData.sharedInstance.defaults!.setValue(SharedData.sharedInstance.totalMoney, forKey: "money")
        print(String(Double(100*SharedData.sharedInstance.totalMoney)/100))
        if (SharedData.sharedInstance.totalMoney > SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningRate - 1) && (SharedData.sharedInstance.totalMoney.truncatingRemainder(dividingBy: SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].earningRate) < 0.5){
            
             WKInterfaceDevice.current().play(.success)
            
        animate(withDuration: 0.5) {
            self.moneyAmount.setTextColor(UIColor.green)
           
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.moneyAmount.setTextColor(UIColor.white)
                }
            }
        }
       
        moneyAmount.setText("$" + String(format: "%.2f", SharedData.sharedInstance.totalMoney))
        
     
       
    }

    
 


   

        
    
    
    
 


    
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if SharedData.sharedInstance.justPurchased == true {
                       moneyAmount.setText("$" +  String(format: "%.2f", SharedData.sharedInstance.totalMoney))
                       threshold = SharedData.sharedInstance.totalMoney
            positionAvatar.setImageNamed(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].image)
           
            
            if SharedData.sharedInstance.upgradeLevel < 3 {
                let currentDevice = WKInterfaceDevice.current()
                let bounds = currentDevice.screenBounds
                let name = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].name
                let range = (SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].name as NSString).range(of: name)
                let attributedString = NSMutableAttributedString(string: SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].name)
    
                if bounds.width == 184 || bounds.width ==  162 {
                    attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 22    , weight: UIFont.Weight.light), range: range)
                }
             
                positionLabel.setAttributedText(attributedString)
            }
            else {
                positionLabel.setText(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].name)
            }
        
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
