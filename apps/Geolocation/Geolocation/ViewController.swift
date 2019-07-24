//
//  ViewController.swift
//  Geolocation
//
//  Created by Victor Poupet on 10/08/16.
//  Copyright © 2016 Monkey Business. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

	@IBOutlet weak var latitudeLabel: UILabel!
	@IBOutlet weak var longitudeLabel: UILabel!
	@IBOutlet weak var horizontalAccuracyLabel: UILabel!
	@IBOutlet weak var altitudeLabel: UILabel!
	@IBOutlet weak var verticalAccuracyLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	
	var locationManager = CLLocationManager()
	var startLocation: CLLocation?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()
		startLocation = nil
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func resetDistance(_ sender: AnyObject) {
		startLocation = nil
	}
}

extension ViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager,
	                     didUpdateLocations locations: [CLLocation])
	{
		let latestLocation = locations.last!
		
		latitudeLabel.text = String(format: "%.4f", latestLocation.coordinate.latitude)
		longitudeLabel.text = String(format: "%.4f", latestLocation.coordinate.longitude)
		horizontalAccuracyLabel.text = String(format: "%.4f", latestLocation.horizontalAccuracy)
		altitudeLabel.text = String(format: "%.4f", latestLocation.altitude)
		verticalAccuracyLabel.text = String(format: "%.4f", latestLocation.verticalAccuracy)
		
		if startLocation == nil {
			startLocation = latestLocation
		}
		
		let distanceBetween: CLLocationDistance = latestLocation.distance(from: startLocation!)
		distanceLabel.text = String(format: "%.2f", distanceBetween)
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
	}
}

