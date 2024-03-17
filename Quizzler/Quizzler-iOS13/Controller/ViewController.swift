//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var Choice1: UIButton!
    @IBOutlet weak var Choice2: UIButton!
    @IBOutlet weak var Choice3: UIButton!
    
    var qno : Int = 0
    var score: Int = 0
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        progressBar.progress = 0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer, qstnNumber: qno)
        
        
        if userGotItRight {
            score += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if qno + 1 < quizBrain.quiz.count{
            qno += 1
        } 
        else {
            qno = 0
            score = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI(){
        Choice1.setTitle(quizBrain.quiz[qno].answer[0], for: UIControl.State.normal)
        Choice2.setTitle(quizBrain.quiz[qno].answer[1], for: UIControl.State.normal)
        Choice3.setTitle(quizBrain.quiz[qno].answer[2], for: UIControl.State.normal)
        
        scoreLabel.text = String(score)
        questionLabel.text = quizBrain.quiz[qno].text
        progressBar.progress = quizBrain.getProgress(qstnNumber: qno)
        Choice1.backgroundColor = UIColor.clear
        Choice2.backgroundColor = UIColor.clear
        Choice3.backgroundColor = UIColor.clear
    }
    
    
}

