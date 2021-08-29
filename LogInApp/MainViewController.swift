//
//  ViewController.swift
//  LogInApp
//
//  Created by Дмитрий Ивашинин on 24.08.2021.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.returnKeyType = UIReturnKeyType.next
        passwordTF.returnKeyType = UIReturnKeyType.done
        passwordTF.enablesReturnKeyAutomatically = true
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loggedInVC = segue.destination as? LoggedInViewController else { return }
        loggedInVC.userName = userNameTF.text
    }
    
    @IBAction func LogInPressed() {
        if userNameTF.text != correctUserName || passwordTF.text != correctPassword {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
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
    
    private let correctUserName = "User"
    private let correctPassword = "Password"
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension MainViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF{
            passwordTF.becomeFirstResponder()
        } else {
            LogInPressed()
            performSegue(withIdentifier: "showLoggedInVC", sender: nil)
        }
        return true
    }
}

