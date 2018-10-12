//
//  triviaQuestion.swift
//  triviaGame
//
//  Created by Spencer Casteel on 10/9/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class TriviaQuestion {
    //string storing the text of the question
    let question: String
    
    //string array storing the potential answers to th question
    let answers: [String]
    
    //store the index of the correct answer in the answer array
    let correctAnswerIndex: Int
    
    //computed property that returns a correct answer for the trivia question
    var correctAnswer: String {
        return answers[correctAnswerIndex]
    }
    
    //initializer for the triviaQuestion class
    init(question: String, answers: [String], correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
}
