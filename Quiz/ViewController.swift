//
//  ViewController.swift
//  Quiz
//
//  Created by Nawfal Alqahtani on 1/14/17.
//  Copyright © 2017 Nawfal Alqahtani. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    //I changed the questions here, because When I followed the book, I thought it is going to be something 
    //I am not going to submit.
    let questions: [String] = [
        "What class is this one?",
        "What is 9*9?",
        "What is my name?"
    ]
    
    let answers: [String] = [
        "CSC-2310",
        "81",
        "Nawfal"
    ]
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
           currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}

