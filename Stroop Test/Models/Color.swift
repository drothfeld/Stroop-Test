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
    var phonetics: [String]?
    static let shared = Color()
    
    init(id: Int, asString: String, asUIColor: UIColor, phonetics: [String]) {
        self.id = id
        self.asString = asString
        self.asUIColor = asUIColor
        self.phonetics = phonetics
    }
    
    private init(){}
    
    func random(maxRange: Int) -> Color { return colors[Int(arc4random_uniform(UInt32(maxRange)) + 0)] }
    static func == (lhs: Color, rhs: Color) -> Bool { return ( (lhs.id == rhs.id) && (lhs.asString == rhs.asString) && (lhs.asUIColor == lhs.asUIColor) ) }
}

let black = Color(id: 1, asString: "black", asUIColor: .black, phonetics: [])
let red = Color(id: 2, asString: "red", asUIColor: .red, phonetics: [])
let yellow = Color(id: 3, asString: "yellow", asUIColor: .yellow, phonetics: [])
let orange = Color(id: 4, asString: "orange", asUIColor: .orange, phonetics: [])
let green = Color(id: 5, asString: "green", asUIColor: .green, phonetics: [])
let purple = Color(id: 6, asString: "purple", asUIColor: .purple, phonetics: [])
let blue = Color(id: 7, asString: "blue", asUIColor: .blue, phonetics: [])
let brown = Color(id: 8, asString: "brown", asUIColor: .brown, phonetics: [])
let cyan = Color(id: 9, asString: "cyan", asUIColor: .cyan, phonetics: ["psion", "teal", "turquoise"])
let magenta = Color(id: 10, asString: "magenta", asUIColor: .magenta, phonetics: ["pink"])
let colors = [black, red, yellow, orange, green, purple, blue, brown, cyan, magenta]
