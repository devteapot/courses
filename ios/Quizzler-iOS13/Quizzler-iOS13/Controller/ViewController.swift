//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answers = quizBrain.getQuetionAnswers()
        
        option1Button.setTitle(answers[0], for: .normal)
        option2Button.setTitle(answers[1], for: .normal)
        option3Button.setTitle(answers[2], for: .normal)
        
        option1Button.backgroundColor = UIColor.clear
        option2Button.backgroundColor = UIColor.clear
        option3Button.backgroundColor = UIColor.clear
    }
}
