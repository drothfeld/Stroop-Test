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
    }
}
