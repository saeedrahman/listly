//
//  ViewController.swift
//  Listly
//
//  Created by Saeed Rahman on 5/1/2018.
//  Copyright © 2018 Saeed Rahman. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priorityType: UISegmentedControl!
    @IBOutlet weak var taskCountStatus: UILabel!
    
    var listItems: [String] = []
    
    func updateTaskCount() {
        if (priorityType.selectedSegmentIndex == 0) {
            taskCountStatus.text = "You have \(ToDoItem.highPriorityItems.count) tasks that need attention"
        } else {
            taskCountStatus.text = "You have \(ToDoItem.lowPriorityItems.count) tasks that need attention"
        }
    }
    
    @IBAction func priorityChangeAction(_ sender: Any) {
        
        tableView.reloadData()
        updateTaskCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (priorityType.selectedSegmentIndex == 0) {
            return ToDoItem.highPriorityItems.count
        } else if (priorityType.selectedSegmentIndex == 1) {
            return ToDoItem.lowPriorityItems.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if (priorityType.selectedSegmentIndex == 0) {
            cell.textLabel?.text = ToDoItem.highPriorityItems[indexPath.row].title
            updateTaskCount()
            return cell
        } else {
            cell.textLabel?.text = ToDoItem.lowPriorityItems[indexPath.row].title
            updateTaskCount()
            return cell
        }
    }
        
    
    // Function to delete entry from array and tableview. Need to ensure that the data is removed from the array first prior to the removing it from the
    // tableview, which would otherwise result in mismatch of data between table and array. See https://www.andrewcbancroft.com/2015/07/16/uitableview-swipe-to-delete-workflow-in-swift/
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if (priorityType.selectedSegmentIndex == 0) {
                ToDoItem.highPriorityItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                updateTaskCount()
            } else {
                ToDoItem.lowPriorityItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                updateTaskCount()
            }
        }
    }
    
    @IBAction func unwindToListVC(segue:UIStoryboardSegue) { }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
