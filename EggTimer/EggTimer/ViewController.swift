//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    let hardnessLevels = ["Soft" : 5, "Medium" : 10, "Hard" : 720]
    var totalSeconds: Float = 0
    var secondsRemaining: Float = 0
    var timer: Timer?

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        self.titleLabel.text = "In progress !!"
        totalSeconds = Float(hardnessLevels[sender.currentTitle!]!)
        startTimer()
        secondsRemaining = totalSeconds
    }

    func startTimer() {        progressView.progress = 0
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }

//            print(self.secondsRemaining)

            self.secondsRemaining -= 1.0

            let progressPercentage = 1.0 - (self.secondsRemaining / self.totalSeconds)

            self.progressView.progress = progressPercentage

            if self.secondsRemaining <= 0 {
                timer.invalidate()
                self.titleLabel.text = "DONE !!"
                playSound()
            }
        }
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
