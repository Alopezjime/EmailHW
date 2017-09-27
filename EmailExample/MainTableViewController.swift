//
//  MainTableViewController.swift
//  EmailExample
//
//  Created by Aron Lopez on 9/23/17.
//  Copyright © 2017 Byrne. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var emailsDictionary = ["Inbox": [Email(sender: "fellow.student@asu.edu",
                                            subject: "Project Question",
                                            contents: "Hi help me please"),
                                      Email(sender: "student.student@asu.edu",
                                            subject: "Test Question",
                                            contents: "When is the exam?")],
                            "Sent":  [Email(sender: "prof@asu.edu",
                                            subject: "Homework",
                                            contents: "Hi turn it in please")],
                            "Trash": [Email(sender: "alert@asu.edu",
                                            subject: "Bees",
                                            contents: "Hi help me please there are bees"),
                                      Email(sender: "asu@asu.edu",
                                            subject: "Spam",
                                            contents: "Spam")]]
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailsDictionary.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        
        let row = indexPath.row
        if row == 0 {
            cell.textLabel?.text = "Inbox"
        } else if row == 1 {
            cell.textLabel?.text = "Sent"
        } else {
            cell.textLabel?.text = "Trash"
        }

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedRow = tableView.indexPathForSelectedRow?.row
        
        let destinationViewController = segue.destination as! MainDetailTableViewController
        destinationViewController.previouslySelectedRow = selectedRow
        
        if selectedRow == 0 {
            destinationViewController.emails = emailsDictionary["Inbox"]
        } else if selectedRow == 1 {
            destinationViewController.emails = emailsDictionary["Sent"]
        } else {
            destinationViewController.emails = emailsDictionary["Trash"]
        }
    }

}
