//
//  ViewController.swift
//  SwitchControllers
//
//  Created by Victor Poupet on 13/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name: String

    @IBOutlet weak var nameLabel: UILabel!
    
    init(name: String) {
        self.name = name
        super.init(nibName: "ViewController", bundle: nil)
    }
    
    deinit {
        print("Controller \(name) was deinitialized")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Controller \(name)"
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchRootController(_ sender: AnyObject) {
        let newViewController = ViewController(name: "Two")
        UIApplication.shared.keyWindow!.rootViewController = newViewController
    }
    
    @IBAction func switchController(_ sender: AnyObject) {
        let newViewController = ViewController(name: "Three")
        present(newViewController, animated: true, completion: nil)
    }

    @IBAction func dismissController(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

