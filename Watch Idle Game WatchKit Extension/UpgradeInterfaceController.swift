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
   
    @IBOutlet weak var thresholdProgressBar: WKInterfaceImage!
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    @IBOutlet weak var upgradeButtonOutlet: WKInterfaceButton!
    
    var currentPosition : Position?

    
    func animateThreshold () {
        thresholdProgressBar.setImageNamed("JanitorThreshold-")
        thresholdProgressBar.startAnimatingWithImages(in: NSMakeRange(Int(SharedData.sharedInstance.totalMoney), 1), duration: 1, repeatCount: 1)
    }
    
    
    @IBAction func upgradeButton() {
        
      print(SharedData.sharedInstance.upgradeLevel)
        print(SharedData.sharedInstance.totalMoney)
        
        
        
        if SharedData.sharedInstance.upgradeLevel == 0 && SharedData.sharedInstance.totalMoney >= 500{
            SharedData.sharedInstance.justPurchased = true
            SharedData.sharedInstance.upgradeLevel += 1
            SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney - 500
            animateThreshold()
            
            

            
            animate(withDuration: 0.2) {
                         self.upgradeButtonOutlet.setBackgroundColor(UIColor.green)
                     }
                     DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                         self.animate(withDuration: 0.2) {
                             self.upgradeButtonOutlet.setBackgroundColor(UIColor.init(red: 31/100, green: 33/100, blue: 36/100, alpha: 1))
                         }
                     }
                     
                        
        }
        
        
       else if  SharedData.sharedInstance.upgradeLevel == 1 &&  SharedData.sharedInstance.totalMoney >= 1000 {
                   SharedData.sharedInstance.justPurchased = true
                   SharedData.sharedInstance.upgradeLevel += 1
                   SharedData.sharedInstance.totalMoney = SharedData.sharedInstance.totalMoney - 1000
                  animateThreshold()
                
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
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.21) {
                self.animate(withDuration: 0.2) {
                    self.upgradeButtonOutlet.setBackgroundColor(UIColor.init(red: 31/100, green: 33/100, blue: 36/100, alpha: 1))
                }
            }
            

    }
            
        
    }
    
    
 
    

       
    
    
    
    
    
    
//    let janitorUpgradeNames = ["Sell broom from work", "Pickpocket CEO", "Pickpocket Salesman", "Gamble in the casino"]
//    let janitorUpgradeImages = ["broom", "pickpocket", "pickpocket", "casino"]
    
    override func awake(withContext context: Any?) {
              super.awake(withContext: context)
    
       print(SharedData.sharedInstance.totalMoney)
        
        currentPosition = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel]
        loadTableData()
        animateThreshold()
        let indexes = NSIndexSet(index: SharedData.sharedInstance.gambleTableViewIndex)
        
        for i in SharedData.sharedInstance.gambleTableViewDeletedCells {
            
            tableView.removeRows(at: indexes as IndexSet)
            
        }
        if SharedData.sharedInstance.totalMoney <= 0 {
                   thresholdProgressBar.setImageNamed("JanitorThreshold-0")
               }
            
          }
    
   
    
    
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        
            SharedData.sharedInstance.gambleTableViewIndex = rowIndex
            pushController(withName: "gambleResult", context: Any?.self)
            let indexes = NSIndexSet(index: rowIndex)
            tableView.removeRows(at: indexes as IndexSet)
        SharedData.sharedInstance.gambleTableViewDeletedCells.append(0)
            
        
    }
    
    
    
    private func loadTableData() {
        if let currentPos = currentPosition {
            

            tableView.setNumberOfRows(currentPos.gambles.count, withRowType: "RowController")
            
            for (index, gamble) in currentPos.gambles.enumerated() {
                
                if let rowController = tableView.rowController(at: index) as? RowController {
                    rowController.upgradeLabel.setText(gamble.name)
                    rowController.upgradeImage.setImageNamed(gamble.image)
                    
                }
                     }
            
            
            
        }
        
        
        
            
            
            
        }
    }
    
    
 
