//
//  TestSessionViewController.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/20/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit

// ==================================================
// Controls the view that generates the Stroops
// being used in a test session and records responses.
// ==================================================
class TestSessionViewController: UIViewController {
    // Storyboard Outlets
    @IBOutlet weak var AudioRecordingIndicator: UIImageView!
    @IBOutlet weak var WordCountLabel: UILabel!
    @IBOutlet weak var StroopTimerLabel: UILabel!
    @IBOutlet weak var StroopLabel: UILabel!
    @IBOutlet weak var bannerAd: UIView!
    
    
    // Controller Values
    var testSession: TestSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
