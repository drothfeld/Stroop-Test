//
//  MenuViewController.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/19/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit

// ==================================================
// Controls the home page view where the user can
// begin a new test session.
// ==================================================
class MenuViewController: UIViewController {
    // Storyboard IBOutlets
    @IBOutlet weak var AppVersionNumberLabel: UILabel!
    @IBOutlet weak var TapToBeginLabel: UILabel!
    
    // Controller Values
    let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting version number in UI
        AppVersionNumberLabel.text = "V-" + appVersionString
        
        // Setup tap gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackground(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Begin title label blinking animtion
        TapToBeginLabel.startBlink()
    }
    
    // Transition to SetupViewController when view is tapped
    @objc func tappedBackground(_ sender: UITapGestureRecognizer) { performSegue(withIdentifier: "toSetup", sender: self) }
}

// UILabel extension to enable blinking animation
extension UILabel {
    // Start UILabel blinking animation
    func startBlink() {
        UIView.animate(withDuration: 1.0, delay:0.0, options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat], animations: {self.alpha = 0.10}, completion: nil)
    }
}

