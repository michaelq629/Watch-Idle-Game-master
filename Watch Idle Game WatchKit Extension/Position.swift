//
//  Position.swift
//  Watch Idle Game WatchKit Extension
//
//  Created by Michael Que on 5/28/20.
//  Copyright © 2020 Michael Que. All rights reserved.
//

import Foundation

struct Position {
    
    var name:String
    var image:String
    var upgradeButtonText:String
    var upgradeButtonCost:Int 
    var gambles:[Gamble]
    var earningRate:Double
    var earningQuad:[Double]
    
    
}

struct Gamble {
    var name:String
    var image:String
    var profitProbability:Double
    var winText:String
    var lossText: String
    var profitAmount : Int
    var lossAmount : Int
    var demotion : String
}
