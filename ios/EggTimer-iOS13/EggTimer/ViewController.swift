//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    
    var timer: Timer?
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        let url = Bundle
            .main
            .url(forResource: "alarm_sound", withExtension: "mp3")

        player = try! AVAudioPlayer(contentsOf: url!)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func selectType(_ sender: UIButton) {
        let targetTime = eggTimes[sender.currentTitle!]!
        
        timer?.invalidate()
        progressBar.progress = 0.0
        titleLabel.text = sender.currentTitle
        
        var seconds = 0
        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true
        ) { timer in
            seconds += 1
            
            self.progressBar.progress = Float(seconds) / Float(targetTime)
            
            print(targetTime - seconds)
            
            if (seconds == targetTime) {
                timer.invalidate()
                self.titleLabel.text = "DONE!"
                self.player.play()
            }
        }
        
    }
    
}
