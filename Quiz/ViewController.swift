//
//  ViewController.swift
//  Quiz
//
//  Created by Nawfal Alqahtani on 1/14/17.
//  Copyright © 2017 Nawfal Alqahtani. All rights reserved.
 // trying hoe to udate 
//

import UIKit
 
class ViewController: UIViewController {
    
    @IBOutlet var currentQuestionLable: UILabel!
    @IBOutlet var currentQuestionLableCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLable: UILabel!
    
    @IBOutlet var nextQuestionLableCenterXConstraint: NSLayoutConstraint!
    

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
       currentQuestionLable.text = questions[currentQuestionIndex]
        
        updateOffScreenLable()
    }
    
    func animateLabelTransitions()
    {
        view.layoutIfNeeded()
       /* let animationClosure = { () ->Void in
            self.questionLabel.alpha = 1
        }
        // Animate the Alpha 
        UIView.animate(withDuration: 0.5, animations: animationClosure)
        UIView.animate(withDuration: 0.5, animations: {
            self.currentQuestionLable.alpha = 0
            self.nextQuestionLable.alpha = 1
        })*/
        let screenWidth = view.frame.width
        self.nextQuestionLableCenterXConstraint.constant = 0
        self.currentQuestionLableCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
            self.currentQuestionLable.alpha = 0
            self.nextQuestionLable.alpha = 1
            self.view.layoutIfNeeded()
        },
        completion: { _ in
            swap(&self.currentQuestionLable, &self.nextQuestionLable)
            swap(&self.currentQuestionLableCenterXConstraint, &self.nextQuestionLableCenterXConstraint)
            
            self.updateOffScreenLable()
            
        })
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        nextQuestionLable.alpha = 0
    }
    
    func updateOffScreenLable()
    {
        let screenWidth = view.frame.width
        nextQuestionLableCenterXConstraint.constant = -screenWidth
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
           currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLable.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}

