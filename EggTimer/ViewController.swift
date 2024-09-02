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
    
    @IBOutlet weak var dialogueLabel: UILabel!
    @IBOutlet weak var timerBar: UIProgressView!
    
    let EggTimes: [String : Int] = ["Soft": 300, "Medium": 420, "Hard": 700]
    
    var secondsRemaining: Int? = nil
    var timer: Timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func eggPressed(_ sender: UIButton) {
                
        let hardness: String? = sender.currentTitle
        let eggTime: Int! = EggTimes[hardness!]!
        self.dialogueLabel.text = hardness!
        secondsRemaining = EggTimes[hardness!]!
        timerBar.progress = 0.0
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            if self.secondsRemaining! > 0 {
                var progress: Float = Float(self.secondsRemaining!)/Float(eggTime)
                self.timerBar.progress = 1 - progress
                self.secondsRemaining!-=1
            } else {
                Timer.invalidate()
                self.dialogueLabel.text = "Done!"
                self.playSound()
                self.timerBar.progress = 1.0
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    
}
