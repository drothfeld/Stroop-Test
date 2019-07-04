//
//  TestSessionViewController.swift
//  Stroop Test
//
//  Created by Dylan Rothfeld on 6/20/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//


import UIKit
import Speech

// ==================================================
// Controls the view that generates the Stroops
// being used in a test session and records responses.
// ==================================================
class TestSessionViewController: UIViewController, SFSpeechRecognizerDelegate {
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
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    
    override func viewDidLoad() {
        displayNextStroop()
        stroopTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TestSessionViewController.updateStroopTimer)), userInfo: nil, repeats: true)
        self.recordAndRecognizeSpeech()
    }
    
    // Decrement the stroop countdown timer and update the interface
    @objc func updateStroopTimer() {
        if (currentTime > 0) {
            currentTime -= 1
            StroopTimerLabel.text = String(currentTime)
        } else {
            displayNextStroop()
            testSession.incorrectResponse()
        }
    }
    
    // Records the users speech and attempts to recognize stroop colors
    func recordAndRecognizeSpeech() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request.append(buffer)
        }
        audioEngine.prepare()
        do { try audioEngine.start() } catch {
            self.AudioRecordingIndicator.alpha = 0.25
            return print(error)
        }
        
        // A recognizer is not supported for the current locale
        guard let myRecognizer = SFSpeechRecognizer() else {
            self.AudioRecordingIndicator.alpha = 0.25
            return
        }
        
        // A recognizer is not available right now
        if !myRecognizer.isAvailable { return }
        
        // Begin audio recognition task
        //
        // TODO (TEMPORARILY FIXED):
        // FIX BUG THAT IS RECORDING THE SAME SPOKEN WORD 3 TIMES IN A ROW.
        //
        self.AudioRecordingIndicator.alpha = 1.00
        var bestString = ""
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
            if let result = result {
                let previousBestString = bestString
                bestString = result.bestTranscription.formattedString
                var lastString: String = ""
                for segment in result.bestTranscription.segments {
                    let indexTo = bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
                    lastString = String(bestString[indexTo...])
                }
                if (previousBestString != bestString) { self.checkRecordedResult(capturedString: lastString.lowercased()) }
            } else if let error = error {
                print(error)
                self.AudioRecordingIndicator.alpha = 0.25
            }
        })
    }
    
    // Checks if a captued audio recording is the correct answer
    func checkRecordedResult(capturedString: String) {
        (capturedString == currentStroop.textColor.asString) ? testSession.correctReponse() : testSession.incorrectResponse()
        displayNextStroop()
    }
    
    // Reset the timer and update the stroop label with the next stroop
    func displayNextStroop() {
        if (testSession.isComplete()) {
            stroopTimer.invalidate()
            // TODO:
            // TEST COMPLETE. SEGUE TO RESULTSVIEWCONTROLLER.
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
