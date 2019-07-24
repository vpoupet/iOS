//
//  ViewController.swift
//  TableViews
//
//  Created by Victor Poupet on 15/07/15.
//  Copyright (c) 2015 Victor Poupet. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var cardsList = [Card]()
    let textCellIdentifier = "textCell"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // define the controller as delegate and data source for the table view
		if let data = UserDefaults.standard.data(forKey: "cards") {
			cardsList = NSKeyedUnarchiver.unarchiveObject(with: data) as! [Card]
		}
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Button methods

    @IBAction func addElement(_ sender: AnyObject) {
        // insert a new element at the end of the table
        cardsList.append(Card.randomCard())
        let indexPath = IndexPath(row: cardsList.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .top)
    }
    
    @IBAction func editTable(_ sender: AnyObject) {
        // switch the editing mode of the table
        if tableView.isEditing {
			tableView.setEditing(false, animated: true)
            editButton.title = "Edit"
        } else {
            tableView.setEditing(true, animated: true)
            editButton.title = "Done"
        }
    }
    
    @IBAction func saveTable(_ sender: AnyObject) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: cardsList)
		UserDefaults.standard.set(encodedData, forKey: "cards")
    }
}

extension TableViewController: UITableViewDataSource {
    // MARK: - TableViewDataSource
    
    func numberOfSections(in _: UITableView) -> Int {
        // Only one section in the table
        return 1
    }
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        // As many rows as there are cards in the list
        return cardsList.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // make the cell corresponding to the card in the table
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) 
        let row = indexPath.row
        let card = cardsList[row]
		
		// configure the cell
        cell.textLabel?.text = card.name
        cell.detailTextLabel?.text = card.typeString
        cell.imageView?.image = card.image
        
        return cell
    }
	
    func tableView(_: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /* This function is called when an insertion or a deletion are performed in the table
            It is necessary to perform the same action on the data table, and remove the cell from the table
        */
        if editingStyle == .delete {
            // deletion
            let row = indexPath.row
            cardsList.remove(at: row)    // remove the card from the list
            tableView.deleteRows(at: [indexPath], with: .top) // remove the cell from the table
        }
    }
    
    func tableView(_: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		/* This function is called when the user exchanges the position of two cells
            It is necessary to perform the same exchange in the data array
        */
        let movedCard = cardsList.remove(at: sourceIndexPath.row)
        cardsList.insert(movedCard, at: destinationIndexPath.row)
    }
}

extension TableViewController: UITableViewDelegate {
	func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
		// When a row is selected, present a view controller that displays the card
		tableView.deselectRow(at: indexPath, animated: true)
		let card = cardsList[indexPath.row]
		let cardController = CardViewController(image: card.image)
		present(cardController, animated: true, completion: nil)
	}
}
