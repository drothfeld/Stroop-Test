//
//  ResultsViewController.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/20/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit

// ==================================================
// Controls the view that displays the results of how
// the user performed during a test session.
// ==================================================
class ResultsViewController: UIViewController {
    // Storyboard Outlets
    @IBOutlet var PerformanceFraction: Array<UILabel>!
    @IBOutlet weak var AverageResponseTimeLabel: UILabel!
    
    // Controller Values
    var testSession: TestSession!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AverageResponseTimeLabel.text = "Average Response Time: " + String(testSession.responseTime.sum() / testSession.responseTime.count) + "s"
        PerformanceFraction[0].text = String(testSession.performance.filter({ $0 == true }).count)
        PerformanceFraction[1].text = String(testSession.performance.count)
    }
}

// Extends Sequence class to return sum of all values
extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element {
        return reduce(.zero, +)
    }
}
