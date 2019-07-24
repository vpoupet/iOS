//
//  ViewController.swift
//  Multiplication Tables
//
//  Created by Victor Poupet on 21/09/16.
//  Copyright © 2016 Monkey Business. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var nSlider: UISlider!
	@IBOutlet weak var nLabel: UILabel!
	@IBOutlet weak var nStepper: UIStepper!
	@IBOutlet weak var mSlider: UISlider!
	@IBOutlet weak var mLabel: UILabel!
	@IBOutlet weak var mStepper: UIStepper!
	@IBOutlet weak var multiplicationView: MultiplicationView!
	
	var n = 0 {
		didSet {
			nStepper.value = Double(n)
			nSlider.value = Float(n)
			nLabel.text = "n = \(n)"
            multiplicationView.setNeedsDisplay()
		}
	}
	var m = 0 {
		didSet {
			mStepper.value = Double(m)
			mSlider.value = Float(m)
			nSlider.maximumValue = Float(m)
			nStepper.maximumValue = Double(m)
			n = min(n, m)
			mLabel.text = "m = \(m)"
            multiplicationView.setNeedsDisplay()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		multiplicationView.controller = self
		mStepper.minimumValue = 2
		mStepper.maximumValue = 200
		mSlider.minimumValue = 2
		mSlider.maximumValue = 200
		m = 100
		n = 2
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func nChanged(_ sender: AnyObject) {
		n = Int(nSlider.value)
	}

	@IBAction func mChanged(_ sender: AnyObject) {
		m = Int(mSlider.value)
	}
	
	@IBAction func nStepperValueChanged(_ sender: AnyObject) {
		n = Int(nStepper.value)
	}
	@IBAction func mStepperValueChanged(_ sender: AnyObject) {
		m = Int(mStepper.value)
	}
}

