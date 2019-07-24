//
//  BezierCurve.swift
//  Bezier
//
//  Created by Victor Poupet on 13/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import Foundation
import UIKit

class BezierCurve {
    
    var controlPoints: [CGPoint]
    
    init(numberOfControlPoints: Int, size: CGSize) {
        controlPoints = [CGPoint]()
        let firstPoint = CGPoint(x: 20, y: size.height/2)
        let lastPoint = CGPoint(x: size.width - 20, y: size.height/2)
        for i in 0 ..< numberOfControlPoints {
            let ratio = CGFloat(i) / CGFloat(numberOfControlPoints - 1)
            let p = (1 - ratio) * firstPoint + ratio * lastPoint
            controlPoints.append(p)
        }
    }
    
    deinit {
        print("A Bezier curve is being deinitialized.")
    }
    
    func subPointsFromPoints(_ points: [CGPoint], atTime t: CGFloat) -> [CGPoint] {
        /** This function computes the sub-control points at a given time
        */
        var newPoints = [CGPoint]()
        for i in 0 ..< points.count - 1 {
            newPoints.append((1-t) * points[i] + t * points[i+1])
        }
        return newPoints
    }
    
    func pointAtTime(_ t: CGFloat) -> CGPoint {
        /** Computes the point on the Bezier curve at time t
        */
        var points = controlPoints
        while points.count != 1 {
            points = subPointsFromPoints(points, atTime: t)
        }
        return points[0]
    }
}
