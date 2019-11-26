//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    var task = [[Task]]() {
        didSet {
            tableView.reloadData()
        }
    }
    func loadData() {
        task = Task.getSections()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }

    @IBAction func sortMe(_ sender: UIBarButtonItem) {
        
        
//        task = task.map({$0.sorted(by: {$0.name < $1.name})})
        
        var newArray = [[Task]]()
        for each in task {
            let sorted = each.sorted(by: {$0.name < $1.name})
            newArray.append(sorted)
//            self.tableView.reloadData()
            // missed extra variable nd appending back to another big array to replae back into tableView
        }
        
        task = newArray
        
    }
    
//    @IBAction func sortWithName(_ sender: UIButton) {
//         items.sort { $0.place < $1.place }
//         self.tableView.reloadData()
//    }
//
//    @IBAction func sortWithStatus(_ sender: UIButton) {
//         items.sort { $0.status < $1.status }
//         self.tableView.reloadData()
//    }
    
}


extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return task.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let currentTask = task[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = currentTask.name
        cell.detailTextLabel?.text = currentTask.dueDate.description
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return task[section].first?.status.rawValue
    }
    
}
