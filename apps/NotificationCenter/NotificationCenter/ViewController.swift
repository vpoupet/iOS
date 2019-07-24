//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Victor Poupet on 03/08/18.
//  Copyright © 2018 Monkey Business. All rights reserved.
//

import UIKit

extension NSNotification.Name {
	static let specialEvent = NSNotification.Name("Special Event")
}

class ViewController: UIViewController {

	@IBOutlet weak var label: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(specialAction(notification:)), name: .specialEvent, object: nil)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func buttonClicked(_ sender: Any) {
		NotificationCenter.default.post(name: .specialEvent, object: self, userInfo: ["value": 12])
	}

    @objc func specialAction(notification: NSNotification) {
		if let info = notification.userInfo, let value = info["value"] {
			label.text = "\(value)"
		}
	}
}

