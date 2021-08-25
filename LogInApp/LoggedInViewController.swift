//
//  LoggedInViewController.swift
//  LogInApp
//
//  Created by Дмитрий Ивашинин on 25.08.2021.
//

import UIKit

class LoggedInViewController: UIViewController {
    var userName: String!
    
    @IBOutlet var logInLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInLabel.text = "Welcome, " + userName + "!"
        
    }

}
