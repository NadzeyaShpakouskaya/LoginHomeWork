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
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        addObservers()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            return isCredentialsCorrect()
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed() {
        checkCredentials()
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
    
    private func checkCredentials() {
        if !isCredentialsCorrect() {
            showAlert(with: "Wrong credentials", and: "Please check your input")
            passwordTextField.text = ""
        } else {
            performSegue(withIdentifier: "toWelcomeVC", sender: self)
        }
    }
    
    private func resetTextField() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

// MARK: - Work with keyboard
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        let kbSize = keyboardSize.cgRectValue
        
        // we need to check frame origin y position,
        // cause we use switching between textfields
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= kbSize.height
        }
    }
    
    
    @objc  func keyboardWillHide(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        let kbSize = keyboardSize.cgRectValue
        
        // we need to check frame origin y position,
        // cause we use switching between textfields
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y += kbSize.height
        }
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
        resetTextField()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            checkCredentials()
            textField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
