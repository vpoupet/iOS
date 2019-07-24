//
//  Card.swift
//  TableViews
//
//  Created by Victor Poupet on 15/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import Foundation
import UIKit

class Card: NSObject, NSCoding {
    let name: String
    let type: [String]
    var typeString: String {
        return type.joined(separator: ", ")
    }
    let image: UIImage
    
	required init?(coder aDecoder: NSCoder) {
		self.name = aDecoder.decodeObject(forKey: "name") as! String
		self.type = aDecoder.decodeObject(forKey: "type") as! [String]
		self.image = UIImage(named: name + ".jpg")!
	}
    
    init(name: String, type: [String]) {
        self.name = name
        self.type = type
        self.image = UIImage(named: name + ".jpg")!
    }
    
    static func randomCard() -> Card {
		
        let randomIndex = Int(arc4random_uniform(UInt32(possibleCards.count)))
        let (name, type) = possibleCards[randomIndex]
		return Card(name: name, type: type)
    }
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(name, forKey: "name")
		aCoder.encode(type, forKey: "type")
	}
	
	static let possibleCards: [(String, [String])] = [
		("Copper", ["Treasure"]),
		("Silver", ["Treasure"]),
		("Gold", ["Treasure"]),
		("Estate", ["Victory"]),
		("Duchy", ["Victory"]),
		("Province", ["Victory"]),
		("Village", ["Action"]),
		("Witch", ["Action", "Attack"]),
		("Cellar", ["Action"]),
		("Chancellor", ["Action"]),
		("Chapel", ["Action"]),
		("Feast", ["Action"]),
		("Festival", ["Action"]),
		("Gardens", ["Victory"]),
		("Militia", ["Action", "Attack"])
	]
}
