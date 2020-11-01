//
//  gambleResult.swift
//  Watch Idle Game WatchKit Extension
//
//  Created by Michael Que on 6/18/20.
//  Copyright © 2020 Michael Que. All rights reserved.
//

import Foundation
import WatchKit


class GambleResult : WKInterfaceController {
    var currentPosition : Position?
    @IBOutlet weak var storyLabel: WKInterfaceLabel!
    func randomBoolWithYesPercentage(percentage:Int) -> Bool{
        return arc4random_uniform(100) < percentage;
    }
    
    override func awake(withContext context: Any?) {
        if let index: Int = context as? Int {
            print(index)
            currentPosition = SharedData.sharedInstance.positionsArray[SharedData.sharedInstance.upgradeLevel]
            if let currentPos = currentPosition {
                var PassOrFail : Bool = false
                var currentGamble = currentPos.gambles[index]
                let modifiedProbabilty =  currentGamble.profitProbability * 100
                print(modifiedProbabilty)
                PassOrFail = randomBoolWithYesPercentage(percentage: Int(modifiedProbabilty))
                if PassOrFail == true {
                    var greenColoredString = String(currentGamble.profitAmount)
                    var range = (currentGamble.winText as NSString).range(of: greenColoredString)
                    var attributedString = NSMutableAttributedString(string:currentGamble.winText)
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green , range: range)
                    attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: range)
                    storyLabel.setAttributedText(attributedString)
                    SharedData.sharedInstance.totalMoney += Double(currentGamble.profitAmount)
                    WKInterfaceDevice.current().play(.success)
                }
                
                else if PassOrFail == false {
                    
                    SharedData.sharedInstance.totalMoney += Double(currentGamble.lossAmount)
                    let negativeAmount = currentGamble.lossAmount * -1
                    var redColoredString = String(negativeAmount)
                    var redRange = (currentGamble.lossText as NSString).range(of: redColoredString)
                    
                    var demotedString = String(currentGamble.demotion)
                    var demotedRange = (currentGamble.lossText as NSString).range(of: demotedString)
                    
                    var redAndDemotedAttributedString = NSMutableAttributedString(string:currentGamble.lossText)
                    redAndDemotedAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: redRange)
                    redAndDemotedAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: demotedRange)
                    redAndDemotedAttributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: redRange)
                    storyLabel.setAttributedText(redAndDemotedAttributedString)
                    WKInterfaceDevice.current().play(.failure)
                    if currentGamble.demotion == "Demoted" {
                        SharedData.sharedInstance.upgradeLevel -= 1
                    }
                }
            }
        }
        
    }
}
