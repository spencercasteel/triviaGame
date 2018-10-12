//
//  SettingsScreen.swift
//  triviaGame
//
//  Created by Spencer Casteel on 10/11/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class SettingsScreen: UIViewController {
    
    @IBOutlet weak var questionTextFeild: UITextField!
    @IBOutlet weak var answer1TextFeild: UITextField!
    @IBOutlet weak var answer2TextFeild: UITextField!
    @IBOutlet weak var answer3TextFeild: UITextField!
    @IBOutlet weak var answer4TextFeild: UITextField!
    @IBOutlet weak var correctAnswerSegmentedControl: UISegmentedControl!
    
    var newQuestion: TriviaQuestion!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if let destination = segue.destination as?  TitleScreenViewController {
            //append the new question to the question array
        destination.userQuestions.append(newQuestion)
        }
    }
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "error", message: "please enter text in all fields, or hit the back button to go back to the quiz.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let question = questionTextFeild.text, !question.isEmpty,
            let answer1 = answer1TextFeild.text, !answer1.isEmpty,
            let answer2 = answer2TextFeild.text, !answer2.isEmpty,
            let answer3 = answer3TextFeild.text, !answer3.isEmpty,
            let answer4 = answer4TextFeild.text, !answer4.isEmpty else {
                showErrorAlert()
                return
        }
    newQuestion = TriviaQuestion(question: question, answers: [answer1, answer2, answer3, answer4], correctAnswerIndex: correctAnswerSegmentedControl.selectedSegmentIndex)
    
        self.performSegue(withIdentifier: "unwindToTitleScreen", sender: self)
    }
}
