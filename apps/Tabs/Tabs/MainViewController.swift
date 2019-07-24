//
//  ViewController.swift
//  Tabs
//
//  Created by Victor Poupet on 13/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
        let quizzController = QuizzViewController()
        quizzController.tabBarItem = UITabBarItem(title: "Quizz", image: nil, tag: 0)
        let bezierController = BezierViewController()
        bezierController.tabBarItem = UITabBarItem(title: "Bezier", image: nil, tag: 1)
		let newController = NewViewController()
		newController.tabBarItem = UITabBarItem(title: "New", image: nil, tag: 2)
        viewControllers = [quizzController, bezierController, newController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

