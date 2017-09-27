//
//  EmailViewController.swift
//  EmailExample
//
//  Created by Aron Lopez on 9/23/17.
//  Copyright © 2017 Byrne. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    var email: Email!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = email.subject
        senderLabel.text = "From: \(email.sender)"
        contentsLabel.text = email.contents
    }

}
