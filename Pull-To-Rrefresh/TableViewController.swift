//
//  TableViewController.swift
//  Pull-To-Rrefresh
//
//  Created by Martin Nordström on 2017-03-14.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // Declear my array
    var myArray:[Int] = [] // This array will be of type Intergers.
    
    var updateData: UIRefreshControl! // Inheritance from UIRefreshControl
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateData = UIRefreshControl() // Creating the refresh controll
        
        updateData.attributedTitle = NSAttributedString(string: "Updating the data") // Adding a simple string to the wheel
        
        updateData.addTarget(self, action: #selector(TableViewController.loadNewData), for: UIControlEvents.valueChanged) // When the refresher is active the function will be called: "TableViewController.loadNewData"
        
        tableView.addSubview(updateData) // Adds everything to our TableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myArray.count // Will return how many values(TableView cells) the myArray has
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        cell.textLabel?.text = String(myArray[indexPath.row]) // The cell's text will converts into a string and will spit out the values in myArray
        
        return cell
    
    }
    
    // Function that will load new data into the TableViewCells
    func loadNewData() {
        
        for i in 0...500 {
            myArray.append(i) // Append 500 TableViewCells
        }
        
        tableView.reloadData() // Updates the data
        updateData.endRefreshing() // End the refreshing
    }

}
