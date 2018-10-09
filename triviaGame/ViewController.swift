//
//  ViewController.swift
//  triviaGame
//
//  Created by Spencer Casteel on 10/8/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newQuestion = TriviaQuestion(question: "is jake gay?", answers: ["yes", "no", "maybe", "just on the days that end with y"], correctAnswerIndex: 3)
        questionLabel.text = newQuestion.question
        answer1Button.setTitle(newQuestion.answers[0], for: .normal)
        answer2Button.setTitle(newQuestion.answers[1], for: .normal)
        answer3Button.setTitle(newQuestion.answers[2], for: .normal)
        answer4Button.setTitle(newQuestion.answers[3], for: .normal)
        
    }

    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if sender.tag == 3 {
            let newAlert = UIAlertController(title: "Thats right", message: "jake is gay everyday", preferredStyle: .actionSheet)
            let closeAction = UIAlertAction(title: "close", style: .default, handler: nil)
            newAlert.addAction(closeAction)
            self.present(newAlert, animated: true, completion: nil)
            
        } else {
            let newAlert = UIAlertController(title: "thats wrong", message: "better luck next time", preferredStyle: .actionSheet)
            let closeAction = UIAlertAction(title: "close", style: .default, handler: nil)
            newAlert.addAction(closeAction)
            self.present(newAlert, animated: true, completion: nil)
        }
    }
}


