//
//  ViewController.swift
//  WordScrambleHWSNoStoryboard
//
//  Created by Herve Desrosiers on 2020-02-17.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//
// https://stackoverflow.com/questions/34565570/conforming-to-uitableviewdelegate-and-uitableviewdatasource-in-swift

import UIKit

class ViewController: UITableViewController {
    
    // 1. define an array containing the data to display in tableView
    var characters = ["Dude", "Dudette", "Ganondorf", "Midna"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

// 2.
// extend ViewController to tell tableview that ViewController will store the data for all rows
extension ViewController {
    // Return the number of rows for the table; called once when tableView loads
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count // one row for each item in characters array
    }
    // Provide a cell object for each row; called for each row of tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type (identifier), reuse or create if no reusable cells ready
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell’s contents.
        cell.textLabel?.text = characters[indexPath.row] // also reassign cell content when cells are reused

        return cell
    }
}

