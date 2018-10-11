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
    
    //the current question that is being answered
    var currentQuestion :TriviaQuestion! {
        //property observer for currentQuestion
        didSet {
            questionLabel.text = currentQuestion.question
            answer1Button.setTitle(currentQuestion.answers[0], for: .normal)
            answer2Button.setTitle(currentQuestion.answers[1], for: .normal)
            answer3Button.setTitle(currentQuestion.answers[2], for: .normal)
            answer4Button.setTitle(currentQuestion.answers[3], for: .normal)
        }
    }
    
    //our array of questions for the trivia game
    var questions: [TriviaQuestion] = []
    
    //this array will hold all of the questions that have been answered
    var questionsPlaceholder: [TriviaQuestion] = []
    
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    //this will store the index of the current question
    var randomIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateQuestions()
        getNewQuestion()
    }
    //array of questions to pull from
    func populateQuestions() {
        let question1 = TriviaQuestion(question: "What War did Captian America Fight in?", answers: ["The War Of 1812", "WW1", "WW2", "The Cold War"], correctAnswerIndex: 2)
        let question2 = TriviaQuestion(question: "Who is Iron Man", answers: ["I Am Iron Man", "Nick Fury", "Steve Rogers", "Tony Stark"], correctAnswerIndex: 3)
        let question3 = TriviaQuestion(question: "What is the name of Peter Quill’s alter-ego?", answers: ["Star-Lord", "Groot", "Drax", "Yondu"], correctAnswerIndex: 0)
        let question4 = TriviaQuestion(question: "Captain America’s shield is made of:", answers: ["adamantium", "vibranium", "kryptonite", "chrome"], correctAnswerIndex: 1)
        let question5 = TriviaQuestion(question: "Where did Iron Man first face off against Whiplash?", answers: ["monaco", "Paris", "Glasgow, Kentucky", "Wal-mart"], correctAnswerIndex: 0)
        questions = [question1, question2, question3, question4, question5]
        
    }
    //this function will be used to get a random question from our array of questions
    func getNewQuestion() {
        if questions.count > 0 {
            //get a random index from 0 up to 1 less than the number of elements in the question array
            randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
            //set currentQuestion equal to the question that is at the random index in the question array
            currentQuestion = questions[randomIndex]
        } else {
            resetGameAlert()
        }
    }
    //alerts user if right
    func showCorrectAnswerAlert() {
        let correctAlert = UIAlertController(title: "Correct", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.questionsPlaceholder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        correctAlert.addAction(closeAction)
        
        self.present(correctAlert, animated: true, completion: nil)
    }
    
    //alerts user if wrong
    func showInncorrectAnswerAlert() {
        let inncorrectAlert = UIAlertController(title: "wrong", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { (_) in
            self.questionsPlaceholder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        inncorrectAlert.addAction(closeAction)
        
        self.present(inncorrectAlert, animated: true, completion: nil)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if sender.tag == currentQuestion.correctAnswerIndex {
            //they got the answer right
            showCorrectAnswerAlert()
            score += 5
        } else {
            //they got the answer wrong
            showInncorrectAnswerAlert()
        }
    }
    
    func resetGame() {
        score = 0
        if !questions.isEmpty {
            questionsPlaceholder.append(contentsOf: questions)
        }
        questions = questionsPlaceholder
        questionsPlaceholder.removeAll()
        
        getNewQuestion()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        resetGame()
    }
    
    func resetGameAlert() {
        let resetAlert = UIAlertController(title: "game stats", message: "your score was \(score) out of \((questionsPlaceholder.count)*5), do you wanna play again?", preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "yes", style: .default) {
            _ in self.resetGame()
        }

        resetAlert.addAction(yesAction)
        
        
        self.present(resetAlert, animated: true, completion: nil)
    }
}

