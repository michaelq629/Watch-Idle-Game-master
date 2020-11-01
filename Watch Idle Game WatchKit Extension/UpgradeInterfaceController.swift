//
//  UpgradeInterfaceController.swift
//  Watch Idle Game WatchKit Extension
//
//  Created by Michael Que on 5/21/20.
//  Copyright © 2020 Michael Que. All rights reserved.
//

import Foundation
import WatchKit
class UpgradeInterfaceController: WKInterfaceController {
    
    var money = 0
    
    @IBOutlet weak var upgradeCostLabel: WKInterfaceLabel!
    @IBOutlet weak var currentPosLabel: WKInterfaceLabel!
    @IBOutlet weak var currentPosPic: WKInterfaceImage!
    @IBOutlet weak var thresholdProgressBar: WKInterfaceImage!
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    @IBOutlet weak var upgradeButtonOutlet: WKInterfaceButton!
    
    var currentPosition : Position?
    var selectedGambleIndex : Int?
    
    func animateThreshold () {
        
        thresholdProgressBar.setImageNamed("watchThresholdPercent-")
        let ratio = SharedData.sharedInstance.totalMoney/Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost) * 100
        
        thresholdProgressBar.startAnimatingWithImages(in: NSMakeRange(Int(ratio), 1), duration: 1, repeatCount: 1)
        
        if SharedData.sharedInstance.totalMoney <= 0 {
            thresholdProgressBar.setImageNamed("watchThresholdPercent-0")
            
        }
        if Int(SharedData.sharedInstance.totalMoney) >= SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost {
            thresholdProgressBar.setImageNamed("watchThresholdPercent-100")
        }
        
    }
    
    @IBAction func upgradeButton() {
        
        print(SharedData.sharedInstance.upgradeLevel)
        print(SharedData.sharedInstance.totalMoney)
        
        
        
        if SharedData.sharedInstance.upgradeLevel == 0 && SharedData.sharedInstance.totalMoney >= Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost){
            SharedData.sharedInstance.justPurchased = true
            SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney - Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost)
            SharedData.sharedInstance.upgradeLevel += 1
            animateThreshold()
           resetStuff()
            WKInterfaceDevice.current().play(.success)
            loadTableData()
            SharedData.sharedInstance.defaults!.setValue(SharedData.sharedInstance.upgradeLevel, forKey: "level")
            
            
            //             let indexes = NSIndexSet(index: SharedData.sharedInstance.gambleTableViewIndex - 1)
            //            for i in indexes {
            //                tableView.removeRows(at: indexes as IndexSet)
            //            }
            
            
            
            
            
            animate(withDuration: 0.2) {
                self.upgradeButtonOutlet.setBackgroundColor(UIColor.green)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.upgradeButtonOutlet.setBackgroundColor(UIColor.init(red: 31/100, green: 33/100, blue: 36/100, alpha: 1))
                }
            }
            
            
        }
        else  if SharedData.sharedInstance.upgradeLevel == 1 && SharedData.sharedInstance.totalMoney >= Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost){
            SharedData.sharedInstance.justPurchased = true
            
            SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney - Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost)
            SharedData.sharedInstance.upgradeLevel += 1
            animateThreshold()
           resetStuff()
            WKInterfaceDevice.current().play(.success)
            SharedData.sharedInstance.defaults!.setValue(SharedData.sharedInstance.upgradeLevel, forKey: "level")

            loadTableData()
//
            
            
            animate(withDuration: 0.2) {
                self.upgradeButtonOutlet.setBackgroundColor(UIColor.green)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.upgradeButtonOutlet.setBackgroundColor(UIColor.init(red: 31/100, green: 33/100, blue: 36/100, alpha: 1))
                }
            }
            
            
        }
        
        else if SharedData.sharedInstance.upgradeLevel == 2 && SharedData.sharedInstance.totalMoney >= Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost){
            SharedData.sharedInstance.justPurchased = true
            
            SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney - Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost)
            SharedData.sharedInstance.upgradeLevel += 1
            animateThreshold()
           resetStuff()
            WKInterfaceDevice.current().play(.success)
            SharedData.sharedInstance.defaults!.setValue(SharedData.sharedInstance.upgradeLevel, forKey: "level")

            loadTableData()

            
            
            animate(withDuration: 0.2) {
                self.upgradeButtonOutlet.setBackgroundColor(UIColor.green)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.upgradeButtonOutlet.setBackgroundColor(UIColor.init(red: 31/100, green: 33/100, blue: 36/100, alpha: 1))
                }
            }
            
            
        }
        
        else if SharedData.sharedInstance.upgradeLevel == 3 && SharedData.sharedInstance.totalMoney >= Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost){
            SharedData.sharedInstance.justPurchased = true
            
            SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney - Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost)
            SharedData.sharedInstance.upgradeLevel += 1
            animateThreshold()
           resetStuff()
            WKInterfaceDevice.current().play(.success)
            loadTableData()
            SharedData.sharedInstance.defaults!.setValue(SharedData.sharedInstance.upgradeLevel, forKey: "level")

            
            
            
            animate(withDuration: 0.2) {
                self.upgradeButtonOutlet.setBackgroundColor(UIColor.green)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.upgradeButtonOutlet.setBackgroundColor(UIColor.init(red: 31/100, green: 33/100, blue: 36/100, alpha: 1))
                }
            }
            
            
        }
        
        else if SharedData.sharedInstance.upgradeLevel == 4 && SharedData.sharedInstance.totalMoney >= Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost){
            SharedData.sharedInstance.justPurchased = true
            
            SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney - Double(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].upgradeButtonCost)
            SharedData.sharedInstance.upgradeLevel += 1
            animateThreshold()
           resetStuff()
            WKInterfaceDevice.current().play(.success)
            SharedData.sharedInstance.defaults!.setValue(SharedData.sharedInstance.upgradeLevel, forKey: "level")

            loadTableData()
            
            
            
            animate(withDuration: 0.2) {
                self.upgradeButtonOutlet.setBackgroundColor(UIColor.green)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.upgradeButtonOutlet.setBackgroundColor(UIColor.init(red: 31/100, green: 33/100, blue: 36/100, alpha: 1))
                }
            }
            
            
        }
        
        
        
        
        
        
        
        else {
            
            
            animate(withDuration: 0.2) {
                self.upgradeButtonOutlet.setBackgroundColor(UIColor.red)
                WKInterfaceDevice.current().play(.failure)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.upgradeButtonOutlet.setBackgroundColor(UIColor.black)
                }
            }
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //
    
    override func awake(withContext context: Any?) {
 
        currentPosPic.setImageNamed(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].image)
        currentPosLabel.setText(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].name)
        
        currentPosition = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel]
        loadTableData()
        animateThreshold()
        
        if SharedData.sharedInstance.totalMoney <= 0 {
            thresholdProgressBar.setImageNamed("watchThresholdPercent-0")
        }
        
        
    }
    
    
    
    
    
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
          
        
        selectedGambleIndex = rowIndex
        print(selectedGambleIndex)
        pushController(withName: "gambleResult", context: selectedGambleIndex)
        WKInterfaceDevice.current().play(.click)
//        let indexes = NSIndexSet(index: rowIndex)
//        tableView.removeRows(at: indexes as IndexSet)
       
       
        
        
        
        
        
    }
    
    
    private func loadTableData() {
        
        
        
        tableView.setNumberOfRows(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].gambles.count, withRowType: "RowController")
        
        for (index, gamble) in SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].gambles.enumerated() {
            
            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.upgradeLabel.setText(gamble.name)
                rowController.upgradeImage.setImageNamed(gamble.image)
                
            }
        }
    }
    
    
    
    override func willActivate() {
        super.willActivate()
        animateThreshold()
        resetStuff()
        loadTableData()
    }
    
    func resetStuff (){
        currentPosPic.setImageNamed(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].image)
        currentPosLabel.setText(SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel].name)
    
    }
}



