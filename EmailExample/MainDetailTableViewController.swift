//
//  MainDetailTableViewController.swift
//  EmailExample
//
//  Created by Aron Lopez on 9/23/17.
//  Copyright © 2017 Byrne. All rights reserved.
//

import UIKit

class MainDetailTableViewController: UITableViewController {
    
    var emails: [Email]?
    var previouslySelectedRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

         self.clearsSelectionOnViewWillAppear = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emails?.count != nil ? emails!.count : 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainDetailCell", for: indexPath)
      
        if let email = emails?[row] {
          cell.textLabel?.text = email.subject
          cell.detailTextLabel?.text = email.sender
        }
    
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard emails != nil else { return }
            emails!.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! EmailViewController
        if emails != nil {
            destinationViewController.email = emails![tableView.indexPathForSelectedRow!.row]
        }
    }

}
