//
//  MultiplicationView.swift
//  Multiplication Tables
//
//  Created by Victor Poupet on 21/09/16.
//  Copyright © 2016 Monkey Business. All rights reserved.
//

import Foundation
import UIKit

class MultiplicationView: UIView {
	var controller: ViewController!
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		let context = UIGraphicsGetCurrentContext()
		
		let scale = min(rect.width, rect.height) / 2 - 2
		let xshift = rect.width / 2
		let yshift = rect.height / 2
		
		let n = controller.n
		let m = controller.m
		
		for i in 1 ..< m {
			context?.setStrokeColor(UIColor(hue: CGFloat(i)/CGFloat(m), saturation: 1, brightness: 1, alpha: 1).cgColor)
			let angle_i = Double(i) * 2 * .pi / Double(m)
			let x_i = CGFloat(cos(angle_i)) * scale + xshift
			let y_i = CGFloat(sin(angle_i)) * scale + yshift
			let angle_ni = Double(n*i) * 2 * .pi / Double(m)
			let x_ni = CGFloat(cos(angle_ni)) * scale + xshift
			let y_ni = CGFloat(sin(angle_ni)) * scale + yshift
			context?.move(to: CGPoint(x: x_i, y: y_i))
			context?.addLine(to: CGPoint(x: x_ni, y: y_ni))
			context?.strokePath()
		}
		for i in 0 ..< m {
			let angle_i = Double(i) * 2 * .pi / Double(m)
			let x_i = CGFloat(cos(angle_i)) * scale + xshift
			let y_i = CGFloat(sin(angle_i)) * scale + yshift
			context?.fillEllipse(in: CGRect(x: x_i - 2, y: y_i - 2, width: 4, height: 4))
		}
		context?.setStrokeColor(UIColor.black.cgColor)
		context?.strokeEllipse(in: CGRect(x: 2, y: 2, width: 2 * scale, height: 2 * scale))
		
	}
}
