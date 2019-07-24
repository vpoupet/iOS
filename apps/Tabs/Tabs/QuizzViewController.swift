//
//  ViewController.swift
//  Quizz
//
//  Created by Victor Poupet on 13/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var questions = [String]()
    var answers = [String]()
    var questionIndex = 0
    
    init() {
        super.init(nibName: "QuizzViewController", bundle: nil)
        questions.append("From what is cognac made?")
        answers.append("Grapes")
        
        questions.append("What is 7 + 7?")
        answers.append("14")
        
        questions.append("What is the capital of Vermont?")
        answers.append("Montpellier")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[questionIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showQuestion(_ sender: AnyObject) {
        questionIndex += 1
        if questionIndex >= questions.count {
            questionIndex = 0
        }
        questionLabel.text = questions[questionIndex]
        answerLabel.text = "???"
    }

    @IBAction func showAnswer(_ sender: AnyObject) {
        answerLabel.text = answers[questionIndex]
    }
}

