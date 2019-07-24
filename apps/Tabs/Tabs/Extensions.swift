//
//  Extensions.swift
//  Bezier
//
//  Created by Victor Poupet on 13/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

// MARK: CGPoint extensions

func *(lambda: CGFloat, p: CGPoint) -> CGPoint {
    return CGPoint(x: lambda * p.x, y: lambda * p.y)
}

func +(p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: p1.x + p2.x, y: p1.y + p2.y)
}

extension CGPoint {
    func distanceTo(_ otherPoint: CGPoint) -> CGFloat {
        let xDist = x - otherPoint.x
        let yDist = y - otherPoint.y
        return sqrt(xDist * xDist + yDist * yDist)
    }
}
