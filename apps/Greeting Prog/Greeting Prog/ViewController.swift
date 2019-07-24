//
//  ViewController.swift
//  Greeting Prog
//
//  Created by Victor Poupet on 30/07/18.
//  Copyright © 2018 Monkey Business. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let myButton = UIButton(type: .system)
	let myLabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		myLabel.text = "???"
		myLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 30)
		myLabel.textAlignment = .center
		view.addSubview(myLabel)
		
        myButton.setTitle("Click Me", for: UIControl.State())
		myButton.frame = CGRect(x: 100, y: 500, width: 200, height: 30)
		myButton.titleLabel?.textAlignment = .center
		view.addSubview(myButton)
		
		myButton.addTarget(self, action: #selector(showGreeting), for: .touchUpInside)
	}
	
    @objc func showGreeting() {
		myLabel.text = "こんにちは"
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

