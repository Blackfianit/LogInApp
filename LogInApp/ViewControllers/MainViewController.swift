//
//  ViewController.swift
//  LogInApp
//
//  Created by Дмитрий Ивашинин on 24.08.2021.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    // MARK: IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: Private Properties
    private let correctUserName = "User"
    private let correctPassword = "Password"
    
    private let user = User.getUser()
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.returnKeyType = UIReturnKeyType.next
        passwordTF.returnKeyType = UIReturnKeyType.done
        passwordTF.enablesReturnKeyAutomatically = true
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let loggedInVC = viewController as? LoggedInViewController {
                loggedInVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutUserVC = navigationVC.topViewController as? AboutMeViewController
                else { return }
                aboutUserVC.user = user
            }
        }
    }
    
    // MARK: IB Actions
    @IBAction func LogInPressed() {
        if userNameTF.text != user.userName || passwordTF.text != user.password {
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
    
    // MARK: Private Methods
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
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

