//
//  Color.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/19/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit

// ==================================================
// Defines static color objects that are used as a
// Stroop's string value or font color.
// ==================================================
struct Color: Equatable {
    var id: Int?
    var asString: String?
    var asUIColor: UIColor?
    static let shared = Color()
    
    init(id: Int, asString: String, asUIColor: UIColor) {
        self.id = id
        self.asString = asString
        self.asUIColor = asUIColor
    }
    
    private init(){}
    
    func random(maxRange: Int) -> Color { return colors[Int(arc4random_uniform(UInt32(maxRange - 1)) + 0)] }
    static func == (lhs: Color, rhs: Color) -> Bool { return ( (lhs.id == rhs.id) && (lhs.asString == rhs.asString) && (lhs.asUIColor == lhs.asUIColor) ) }
}

let black = Color(id: 1, asString: "black", asUIColor: .black)
let red = Color(id: 2, asString: "red", asUIColor: .red)
let yellow = Color(id: 3, asString: "yellow", asUIColor: .yellow)
let orange = Color(id: 4, asString: "orange", asUIColor: .orange)
let green = Color(id: 5, asString: "green", asUIColor: .green)
let purple = Color(id: 6, asString: "purple", asUIColor: .purple)
let blue = Color(id: 7, asString: "blue", asUIColor: .blue)
let brown = Color(id: 8, asString: "brown", asUIColor: .brown)
let cyan = Color(id: 9, asString: "cyan", asUIColor: .cyan)
let magenta = Color(id: 10, asString: "magenta", asUIColor: .magenta)
let colors = [black, red, yellow, orange, green, purple, blue, brown, cyan, magenta]
