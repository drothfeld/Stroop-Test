//
//  Stroop.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/19/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit

// ==================================================
// Defines a stroop object that contains the color
// for the literal text string and its font color.
// ==================================================
struct Stroop: Equatable {
    var textColor: Color
    var fontColor: Color
    
    init (colorRange: Int, isMismatched: Bool) {
        self.textColor = Color.shared.random(maxRange: colorRange)
        repeat {
            self.fontColor = Color.shared.random(maxRange: colorRange)
        } while (isMismatched && self.fontColor == self.textColor)
    }
    
    static func == (lhs: Stroop, rhs: Stroop) -> Bool { return ( (lhs.textColor == rhs.textColor) && (lhs.fontColor == rhs.fontColor) ) }
}
