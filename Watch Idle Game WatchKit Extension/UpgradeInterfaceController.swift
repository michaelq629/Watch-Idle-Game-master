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
    
   

 
    

       
    
    
    
    
    
    
    let janitorUpgradeNames = ["Sell broom from work", "Pickpocket CEO", "Pickpocket Salesman", "Gamble in the casino"]
    let janitorUpgradeImages = ["broom", "pickpocket", "pickpocket", "casino"]
    
    override func awake(withContext context: Any?) {
              super.awake(withContext: context)
    
       
        
        thresholdProgressBar.setImageNamed("JanitorThreshold-")
        thresholdProgressBar.startAnimatingWithImages(in: NSMakeRange(money, 1), duration: 1, repeatCount: 1)
              loadTableData()
        
            
          }
    
    
    
    private func loadTableData() {
        
        
        tableView.setNumberOfRows(janitorUpgradeNames.count, withRowType: "RowController")
        
        for (index, rowModel) in janitorUpgradeNames.enumerated() {
            
            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.upgradeLabel.setText(rowModel)
                
            }
            for (index, rowModel) in janitorUpgradeImages.enumerated() {
                         
                         if let rowController = tableView.rowController(at: index) as? RowController {
                          rowController.upgradeImage.setImageNamed(rowModel)
                         }
                         
                     }
                 }
            
            
            
        }
    }
    
    
 
