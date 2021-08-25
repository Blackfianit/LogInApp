//
//  ViewController.swift
//  LogInApp
//
//  Created by Дмитрий Ивашинин on 24.08.2021.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    let correctUserName = "User", correctPassword = "Password"
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameHintButton: UIButton!
    @IBOutlet var passwordHintButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.returnKeyType = UIReturnKeyType.next
        passwordTF.returnKeyType = UIReturnKeyType.done
        passwordTF.enablesReturnKeyAutomatically = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userNameTF.text == correctUserName, passwordTF.text == correctPassword {
            guard let loggedInVC = segue.destination as? LoggedInViewController else { return }
            loggedInVC.userName = userNameTF.text
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            passwordTF.text = ""
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    @IBAction func userNameHintButtonPressed() {
        showAlert(title: "Oops!", message: "Your username is \(correctUserName)")
    }
    @IBAction func passwordHintButtonPressed() {
        showAlert(title: "Oops!", message: "Your password is \(correctPassword)")
    }
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == userNameTF {
         textField.resignFirstResponder()
         passwordTF.becomeFirstResponder()
      } else if textField == passwordTF {
         textField.resignFirstResponder()
      }
     return true
    }
    
}

