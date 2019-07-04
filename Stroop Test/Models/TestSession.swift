//
//  TestSession.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/21/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit

// ==================================================
// Defines a stroop test session that contains the
// generated stroop objects and keeps track of a
// user's performance during a test.
// ==================================================
struct TestSession {
    var stroops = [Stroop]()
    var performance = [Bool]()
    var responseTimeLimit = 10
    
    init(numberOfStroops: Int, responseTimeLimit: Int, colorRange: Int, allowRepeats: Bool, allowSameTextFontColor: Bool) {
        self.responseTimeLimit = responseTimeLimit
        repeat {
            let newStroop = Stroop(colorRange: colorRange, isMismatched: !allowSameTextFontColor)
            if ( (!stroops.contains(newStroop) && !allowRepeats) || (allowRepeats)) { stroops.append(newStroop) }
        } while stroops.count != numberOfStroops
    }
    
    // Returns whether the test session is complete
    func isComplete() -> Bool { return (self.performance.count >= self.stroops.count) }
    
    // Stroop was incorrectly identified
    mutating func incorrectResponse() { self.performance.append(false) }
    
    // Stroop was correctly identified
    mutating func correctReponse() { self.performance.append(true) }
}
