//
//  MyViewController.swift
//  NavigationController
//
//  Created by Victor Poupet on 14/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
	var name = "One"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		nameLabel.text = name
        // Do any additional setup after loading the view, typically from a nib.
    }

    init(name: String) {
        super.init(nibName: "MyViewController", bundle: nil)
		self.name = name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchController(_ sender: AnyObject) {
        let newViewController = MyViewController(name: "Two")
        newViewController.title = "Two"
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
}

