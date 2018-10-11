//
//  TitleScreenViewController.swift
//  triviaGame
//
//  Created by Spencer Casteel on 10/9/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {
    
    var userQuestions: [TriviaQuestion] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ViewController {
            destination.questions.append(contentsOf: userQuestions)
        }
    }
 
//unwind segue to this screen
    @IBAction func unwindToTitleScreen(segue: UIStoryboardSegue) { }
}
