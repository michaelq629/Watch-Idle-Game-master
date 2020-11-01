//
//  OnboardingPage.swift
//  Watch Idle Game WatchKit Extension
//
//  Created by Michael Que on 9/20/20.
//  Copyright © 2020 Michael Que. All rights reserved.
//

import Foundation
import WatchKit

class OnboardingPage: WKInterfaceController {
    
    
    @IBAction func finishOnboarding() {
      let defaults = UserDefaults.standard
        defaults.set(true, forKey: "didShowOnboarding")
    }
    
    
    
    
    
}
