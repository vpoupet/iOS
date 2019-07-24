//
//  ViewController.swift
//  Bezier
//
//  Created by Victor Poupet on 13/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

class BezierViewController: UIViewController {

    var bezierView: BezierView!     // the view as a BezierView
    var movingPointIndex: Int?      // the index of the currently moving control point
    var currentTouch: UITouch?
    var numberOfControlPoints: Int {
        return Int(controlPointsStepper.value)
    }
    
    @IBOutlet weak var controlPointsStepper: UIStepper!     // stepper for selecting the number of control points
    @IBOutlet weak var timeSlider: UISlider!    // slider for choosing the rendered time

    @IBAction func changeTime(_ sender: AnyObject) {
        // the rendered time has been changed
        bezierView.time = CGFloat(timeSlider.value)
    }
    
    @IBAction func changeNumberOfControlPoints(_ sender: AnyObject) {
        makeBezierCurve()
    }
    
    func makeBezierCurve() {
        bezierView.bezierCurve = BezierCurve(numberOfControlPoints: numberOfControlPoints, size: bezierView.bounds.size)
        bezierView.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bezierView = view as! BezierView
        
        // setup the time slider
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = 1
        timeSlider.value = Float(bezierView.time)
        
        // setup the control points stepper
        controlPointsStepper.value = 6
        controlPointsStepper.minimumValue = 3
        controlPointsStepper.maximumValue = 10
        controlPointsStepper.stepValue = 1
		
		let tapRecognizer = UITapGestureRecognizer()
		tapRecognizer.numberOfTapsRequired = 2
		tapRecognizer.addTarget(self, action: #selector(toggleColor))
		view.addGestureRecognizer(tapRecognizer)
    }
	
    @objc func toggleColor() {
		bezierView.lightTheme = !bezierView.lightTheme
		if bezierView.lightTheme {
			bezierView.backgroundColor = UIColor.white
		} else {
			bezierView.backgroundColor = UIColor.black
		}
		bezierView.setNeedsDisplay()
	}
	
    override func viewDidAppear(_ animated: Bool) {
        makeBezierCurve()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentTouch == nil {
            currentTouch = touches.first!
        }
        
        if let currentTouch = currentTouch {
            let touchLocation = currentTouch.location(in: view)
            var bestMatchDistance: CGFloat? = nil
            for (i, p) in bezierView.bezierCurve!.controlPoints.enumerated() {
                let d = p.distanceTo(touchLocation)
                if d < 50 {
                    if bestMatchDistance == nil || bestMatchDistance! > d {
                        movingPointIndex = i
                        bestMatchDistance = d
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let currentTouch = currentTouch, let i = movingPointIndex {
            if touches.contains(currentTouch) {
                let touchLocation = currentTouch.location(in: view)
                bezierView.bezierCurve!.controlPoints[i] = touchLocation
                bezierView.setNeedsDisplay()
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        movingPointIndex = nil
        currentTouch = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        movingPointIndex = nil
        currentTouch = nil
    }
}

