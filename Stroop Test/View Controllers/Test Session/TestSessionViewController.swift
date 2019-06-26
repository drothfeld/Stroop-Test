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
    var currentStroop: Stroop!
    var stroopTimer = Timer()
    var stroopCount = 0
    var currentTime = 0
    
    
    override func viewDidLoad() {
        displayNextStroop()
        stroopTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TestSessionViewController.updateStroopTimer)), userInfo: nil, repeats: true)
    }
    
    // Decrement the stroop countdown timer and update the interface
    @objc func updateStroopTimer() {
        if (currentTime > 0) {
            currentTime -= 1
            StroopTimerLabel.text = String(currentTime)
        } else { displayNextStroop() }
    }
    
    // Reset the timer and update the stroop label with the next stroop
    func displayNextStroop() {
        if (testSession.isComplete(stroopCount: stroopCount)) {
            stroopTimer.invalidate()
            // TODO:
            // TEST COMPLETE. SHOW SPINNER WHILE ANALYZING PERFORMANCE AND SEGUE TO RESULTSVIEWCONTROLLER
        } else {
            stroopCount += 1
            WordCountLabel.text = "Word Count: " + String(stroopCount)
            currentStroop = testSession.stroops[stroopCount - 1]
            StroopLabel.text = currentStroop.textColor.asString
            StroopLabel.textColor = currentStroop.fontColor.asUIColor
            currentTime = testSession.responseTimeLimit
            StroopTimerLabel.text = String(testSession.responseTimeLimit)
        }
    }
}
