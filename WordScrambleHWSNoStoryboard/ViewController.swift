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
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Word")
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }

        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()

        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(answer, at: 0)

                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                }
            }
        }
    }
    
    func isPossible(word: String) -> Bool {
        return true
    }

    func isOriginal(word: String) -> Bool {
        return true
    }

    func isReal(word: String) -> Bool {
        return true
    }

}

// 2.
// extend ViewController to tell its own (default) tableview that ViewController will store the data for all rows
extension ViewController {
    // Return the number of rows for the table; called once when tableView loads
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count // one row for each item in characters array
    }
    // Provide a cell object for each row; called for each row of tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type (identifier), reuse or create if no reusable cells ready
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        // Configure the cell’s contents.
        cell.textLabel?.text = usedWords[indexPath.row] // also reassign cell content when cells are reused

        return cell
    }
}

