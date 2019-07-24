//
//  BezierView.swift
//  Bezier
//
//  Created by Victor Poupet on 13/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

class BezierView: UIView {
    
    // MARK: Properties

    // the rendered time (between 0 and 1)
    var time: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // the Bezier curve that is being represented
    var bezierCurve: BezierCurve?
        
    // MARK: Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: UIView methods
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let bezierCurve = bezierCurve, let context = UIGraphicsGetCurrentContext() {
            let controlPoints = bezierCurve.controlPoints
            
            // draw the sub-segments
            var points = controlPoints
            var hue: CGFloat = 0
            while points.count > 0 {
                context.setStrokeColor(UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1).cgColor)
                context.setFillColor(UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1).cgColor)
                for p in points {
                    context.fillEllipse(in: CGRect(x: p.x - 5, y: p.y - 5, width: 10, height: 10))
                }
                context.move(to: CGPoint(x: points[0].x, y: points[0].y))
                for i in 1 ..< points.count {
                    context.addLine(to: CGPoint(x: points[i].x, y: points[i].y))
                }
                context.strokePath()
                points = bezierCurve.subPointsFromPoints(points, atTime: time)
                hue += CGFloat(1) / CGFloat(controlPoints.count)
            }

            // circle the control points
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(2)
            for p in controlPoints {
                context.strokeEllipse(in: CGRect(x: p.x - 8, y: p.y - 8, width: 16, height: 16))
            }

            // draw the bezier curve
            context.move(to: CGPoint(x: controlPoints.first!.x, y: controlPoints.first!.y))
            context.setLineWidth(3)
            for i in 1 ... 100 {
                let t = CGFloat(i) / 100
                let p = bezierCurve.pointAtTime(t)
                context.addLine(to: CGPoint(x: p.x, y: p.y))
            }
            context.strokePath()
        }
    }
    
}
