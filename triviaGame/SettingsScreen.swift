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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func submitButtonTapped(_ sender: Any) {
    }
}
