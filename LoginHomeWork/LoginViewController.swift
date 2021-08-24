//
//  LoginViewController.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 24/08/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Private properties
    private let username = "user"
    private let password = "pass"
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 20
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toWelcomeVC" {
            return isCredentialsCorrect()
        }
        return true
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed() {
        if !isCredentialsCorrect() {
            showAlert(with: "Wrong credentials", and: "Please check your input")
        }
    }
    
    @IBAction func usernameHintButtonPressed() {
        showAlert(with: "Username hint:", and: username)
    }
    
    @IBAction func passwordHintButtonPressed() {
        showAlert(with: "Password hint:", and: password)
    }
    
    // MARK: - Private methods
    private func showAlert(with title: String, and text:String) {        
        let alert = UIAlertController(
            title: title,
            message: text,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func isCredentialsCorrect() -> Bool {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text
        else { return false }
        return  username == self.username && password == self.password
    }
}

// MARK: - Navigation
extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController
        else { return }
        welcomeVC.username = usernameTextField.text ?? ""
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}
