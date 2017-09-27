//
//  Email.swift
//  EmailExample
//
//  Created by Aron Lopez on 9/24/17.
//  Copyright © 2017 Byrne. All rights reserved.
//

import Foundation

class Email {
    let sender: String
    let subject: String
    let contents: String
    
    init(sender: String, subject: String, contents: String) {
        self.sender = sender
        self.subject = subject
        self.contents = contents
    }
}
