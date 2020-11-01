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
    var defaults : UserDefaults?
    

    class var sharedInstance: SharedData {
        struct Singleton { static let instance = SharedData() }
        return Singleton.instance
    }
    
    
    private init() {
        
        
        let gamble1 = Gamble.init(name: "Sell broom from work ", image: "broom", profitProbability : 0.8, winText:"You successfully sell the broom in the Janitor's closet for 50 dollars", lossText :"You attempted to sell your broom but was caught by your manager. You have lost 50 dollars in wages to cover for the broom", profitAmount :50, lossAmount: -50, demotion :"")
        let gamble2 = Gamble.init(name: "Pickpocket CEO", image: "moneyFace", profitProbability : 0.7, winText:"You pickpocketed the CEO while pretending to clean up his mess and got 200 dollars", lossText :"You tried to Pickpocket the CEO by pretending to clean up after him but your grasp was too strong. You lost 100 dollars in wages as a result. ", profitAmount :200, lossAmount: -100, demotion :"")
        let gamble3 = Gamble.init(name: "Pickpocket Salesman ", image: "pinchingHand", profitProbability : 0.6, winText:"You pickpocketed 100 dollars from the Salesman while pretending to clean something on his feet.", lossText :"You tried to pickpocket the salesman by pretending there was something on his feet, he kicked you in the face instead ", profitAmount :100, lossAmount: 0, demotion :"")
        let gamble4 = Gamble.init(name: "Gamble in the Casino ", image: "casino", profitProbability : 0.7, winText:"Your broke and decided to try your luck at the Casino, surprisingly, you won 100 dollars. ", lossText :"Your broke and decided to try your luck at the Casino. You lost 50 dollars as a result and got thrown out of the Casino ", profitAmount :100, lossAmount: -50, demotion :"")
        let gamble5 = Gamble.init(name: "Steal company supplies", image: "package", profitProbability : 0.8, winText:"You got a couple of shipments from the warehouse and successfully sold it on the Black Market for 1000 dollars. ", lossText :"You got a couple of shipments from the warehouse and was preparing to sell it on the black market. However, you forgot to clear your browser history and was Demoted. You also paid 200 in fines ", profitAmount :1000, lossAmount: -200, demotion :"Demoted")
        let gamble6 = Gamble.init(name: "Gamble in the Casino ", image: "casino", profitProbability : 0.5, winText:"You went to the Casino after a hard day at work, and won 200 dollars. ", lossText :"You went to the Casino after a long day at work, and lost 50 dollars. ", profitAmount :200, lossAmount: -50, demotion :"")
        let gamble7 = Gamble.init(name: "Store Drugs", image: "drugs", profitProbability : 0.9, winText:"You used some of the warehouse storage to store drugs for your friend Diego, and got 1000 dollars as a reward ", lossText :"You used some of the warehouse storage to store drugs for your friend Diego, but you were discovered after the manager checked the warehouse because of your foul smell. You have been Demoted and lost 200 dollars to legal fees", profitAmount :1000, lossAmount: -200, demotion :"Demoted")
        let gamble8 = Gamble.init(name: "Strike", image: "strike", profitProbability : 0.9, winText:"You start a strike with some of your coworkers demanding more pay, and got a cash settlement of 200 dollars instead ", lossText :"You start a strike with some of your coworkers demand more pay, but it failed and you were Demoted as a result ", profitAmount :200, lossAmount: 0, demotion :"Demoted")
        let gamble9 = Gamble.init(name: "Sue company for poor working conditions", image: "sue", profitProbability : 0.8, winText:"You decided to sue the company for poor working conditions by faking it. You succeeded and got 500 dollars as a reward", lossText :"You decided to sue the company for poor working conditions by faking it. You failed and as a result was Demoted, you also have to pay 100f dollars total for the legal fees", profitAmount :500, lossAmount: -100, demotion :"Demoted")
        let gamble10 = Gamble.init(name: "Fake an injury", image: "injury", profitProbability : 0.9, winText:"You decided to get some money by faking an injury and succeeded, bringing in 200 dollars. ", lossText :"You decided to get some money by faking an injury, you failed while your boss saw you eating a big mac with both hands. You lost 50 dollars of wages as a result", profitAmount :200, lossAmount: -50, demotion :"")
        let gamble11 = Gamble.init(name: "Share company secrets ", image: "secret", profitProbability : 0.8, winText:"You decided to share the company's secrets with Richard from a rival company. You were rewarded 10000 dollars for your information. ", lossText :"You were caught while sharing company secrets with Richard from a rival company. You were Demoted as a result and lost 9000 dollars in fines ", profitAmount :10000, lossAmount: -9000, demotion :"Demoted")
        let gamble12 = Gamble.init(name: "Steal co-worker's clients", image: "handshake", profitProbability : 0.5, winText:"You successfully stole your co-worker's clients and got a fat check of 5000 dollars as commision", lossText :"You tried to steal your co-worker's clients, but your lack of social skills made the client report this to the company. You lost 200 dollars in wages.", profitAmount :5000, lossAmount: -200, demotion :"")
        let gamble13 = Gamble.init(name: "Gamble in the Casino", image: "casino", profitProbability : 0.5, winText:"You went into the casino to try your luck, and won 1000 dollars ", lossText :"You went into the Casino to try your luck, and lost 500 dollars.", profitAmount :1000, lossAmount: -500, demotion :"")
        let gamble14 = Gamble.init(name: "Steal regional manager's bank account ", image: "bankaccount", profitProbability : 0.7, winText:"You successfully, stole the password of your regional manager's bank account and cashed out 1000 dollars ", lossText :"You stole the password of your regional manger's bank account but you purchase was so strange that his wife reported it. You have been Demoted and forced to pay 500 dollars for legal fees", profitAmount :1000, lossAmount: -500, demotion :"Demoted")
        let gamble15 = Gamble.init(name: "Steal CEO's bank account", image: "moneyFace", profitProbability : 0.9, winText:"You successfully stole the CEO's bank account and cashed out 10000 dollars", lossText :"You stole the CEO's bank account and made some purchases, but turns out the money was fraudulent. You were Demoted from the company and forced to pay 9000 dollars for legal fees", profitAmount :10000, lossAmount: -9000, demotion :"Demoted")
        let gamble16 = Gamble.init(name: "Sabotage your regional manager", image: "evil", profitProbability : 0.8, winText:"You sabotaged your boss by placing drugs in his desk and reporting it. You were awarded 1000 dollars. ", lossText :"You tried to sabotage your boss by placing drugs in his desk, however, instead you couldn't resist consuming the drugs and was Demoted. You paid 500 dollars in legal fees for obtaining the drugs. ", profitAmount :1000, lossAmount: -500, demotion :"Demoted")
        let gamble17 = Gamble.init(name: "Lie about your branch's performance ", image: "lie", profitProbability : 0.3, winText:"You lied about your branch's performance, and was given a bonus of 50000 dollars. ", lossText :"You lied about your branch's performance, but a math calculation that you made wrong led to further investigation which exposed you. You were Demoted as a result. ", profitAmount :50000, lossAmount: 0 , demotion :"Demoted")
        let gamble18 = Gamble.init(name: "Sabotage another branch", image: "clown", profitProbability : 0.4, winText:"You sent spies to other branch to uncover the secrets of their regional manager. You reported it to the CEO and got a bonus ", lossText :"You tried sending spies to another branch to uncover their secrets. Unforntuanly, your spy turned out to be the CEO! You were Demoted ", profitAmount :50000, lossAmount: 0, demotion :"Demoted")
        let gamble19 = Gamble.init(name: "Save money by cutting employee's health care", image: "hospital", profitProbability : 0.6, winText:"You were able to save money by cutting out employee's health care, and was awarded 20000 dollars as a bonus ", lossText :"You tried to save money by cutting employee's health care. However, an employee sued you. You were able to win the case, but paid 5000 dollars in legal proceedings.", profitAmount :20000, lossAmount: -5000, demotion :"")
        let gamble20 = Gamble.init(name: "Start your own company ", image: "lightbulb", profitProbability : 0.3, winText:"You started your own company with the list of clients you already have. However, it quickly went bust, but not before you managed to sell it to your old company and get your old job back with a profit of 100000. ", lossText :"You started your own company with the list of clients you already had. However, it failed and you were forced to beg for your old job, you were Demoted. ", profitAmount :100000, lossAmount: 0, demotion :"Demoted")
        let gamble21 = Gamble.init(name: "Overwork your branches", image: "tired", profitProbability : 0.8, winText:"You overworked your branches and was able to earn 50000 dollars as a bonus. ", lossText :"You overworked your branches, however, workers from one branch suffered a stroke as a result of your over-workings. You were Demoted and paid medical fees of 100000 dollars", profitAmount :50000, lossAmount: -100000, demotion :"Demoted")
        let gamble22 = Gamble.init(name: "Start your own company ", image: "lightbulb", profitProbability : 0.5, winText:"You started your own company with the list of clients you already have. However, it quickly went bust, but not before you managed to sell it to your old company and get your old job back. ", lossText :"You started your own company with the list of clients you already had. However, it failed and you were forced to beg for your old job, you were Demoted. ", profitAmount :1000000, lossAmount: 0, demotion :"Demoted")
        let gamble23 = Gamble.init(name: "Lie about your branches's performance", image: "lie", profitProbability : 0.5, winText:"You lied about the performance of your branches to the CEO and was given a bonus of 100000", lossText :"You lied about the performance of your branches to the CEO. However,  you were exposed after you bragged about your success to the hot receptionist. You were Demoted and forced to pay a fine of 10000 dollars", profitAmount :100000, lossAmount: -10000, demotion :"")
        
let Janitor = Position.init(name: "Janitor", image: "janitor", upgradeButtonText: "Warehouse", upgradeButtonCost: 500, gambles: [gamble1, gamble2, gamble3, gamble4], earningRate: 10, earningQuad: [0.025, 0.05, 0.075, 0.1])
let Warehouse = Position.init(name: "Warehouse", image: "warehouse", upgradeButtonText: "Salesman", upgradeButtonCost: 5000, gambles: [gamble5, gamble6, gamble7, gamble8, gamble9, gamble10] , earningRate: 100, earningQuad: [0.25, 0.50, 0.75, 1])
        let Salesman = Position.init(name: "Salesman", image: "Salesman", upgradeButtonText: "Regional Manager", upgradeButtonCost: 75000, gambles: [gamble11, gamble12, gamble13, gamble14, gamble15, gamble16], earningRate: 1000, earningQuad: [2.5, 5, 7.5, 10])
        let regionalManager = Position.init(name: "Regional Manager" , image: "Regional Manager", upgradeButtonText: "Vice President", upgradeButtonCost: 1000000, gambles: [gamble17, gamble18, gamble19, gamble20, gamble21], earningRate: 10000, earningQuad: [25, 50, 75, 100])
        let vicePresident = Position.init(name: "Vice President" , image: "Vice President", upgradeButtonText: "CEO", upgradeButtonCost: 20000000, gambles: [gamble21, gamble22, gamble23], earningRate: 100000, earningQuad: [250, 500, 750, 1000])
        
        
        positionsArray.append(Janitor)
        positionsArray.append(Warehouse)
        positionsArray.append(Salesman)
         positionsArray.append(regionalManager)
         positionsArray.append(vicePresident)
        
        
        print(positionsArray)
    }
    
}
