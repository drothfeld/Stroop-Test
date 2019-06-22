//
//  SetupViewController.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/20/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit

// ==================================================
// Controls the view where the user chooses parameter
// options for a new test session.
// ==================================================
class SetupViewController: UIViewController, UITextFieldDelegate {
    // Storyboard Outlets
    @IBOutlet weak var NumbWordsTextField: UITextField!
    @IBOutlet weak var TimeLimitTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Validate number range text field
    func validateTextField(uiTextField: UITextField, valueRange: (Int, Int)) {
        if (Int(uiTextField.text!) == nil) { uiTextField.text = nil }
        else {
            if (Int(uiTextField.text!)! < valueRange.0) { uiTextField.text = String(valueRange.0) }
            if (Int(uiTextField.text!)! > valueRange.1) { uiTextField.text = String(valueRange.1) }
        }
    }
    
    // Hide keyboard when users presses the done/return key
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // Number of words text field value changes
    @IBAction func numbWordsFieldChanges(_ sender: Any) { validateTextField(uiTextField: NumbWordsTextField, valueRange: (1, 40)) }
    
    // Word time limit text field value changes
    @IBAction func wordTimeLimitFieldChanges(_ sender: Any) { validateTextField(uiTextField: TimeLimitTextField, valueRange: (5, 30)) }
}
