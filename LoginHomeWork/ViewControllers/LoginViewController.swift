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
    
    // MARK: - Private properties
    
    //test data
    private let user = User(
        username: "user",
        password: "pass",
        personalInfo: Person(
            name: "Nadzeya",
            surname: "Spakouskaya",
            sex: .female,
            dateOfBirth: "27 Sept. 1987",
            address: "Dubai, UAE",
            photoLink: "photo",
            contactInfo: ContactInfo(
                phoneNumber: "+12345667",
                email: "test@gmail.com"),
            workPlaces: [
                WorkPlace(
                    company: "Some Company Ltd.",
                    position: "iOS Developer",
                    dateOfStart: "Sept. 2020 ",
                    dateOfFinishing: "Now",
                    description: "Work as Junior iOS Developer. "),
                WorkPlace(
                    company: "Another Company Ltd.",
                    position: "iOS Developer",
                    dateOfStart: "Okt. 2018 ",
                    dateOfFinishing: "Sept. 2020",
                    description: "Work as Junior iOS Developer. ")
            ],
            education: [
                Education(name: "BSEU",
                          levelDegree: .bachelor,
                          specialization: "Management and Economics",
                          dateOfStart: "Sept. 2006",
                          dateOfFinishing: "Febr. 2012"),
                Education(name: "Minsk Architecture and Construction College",
                          levelDegree: .associate,
                          specialization: "Economic in Construction",
                          dateOfStart: "Sept. 2003",
                          dateOfFinishing: "Jul. 2006")
            ],
            courses: [
                Certificate(
                    title: "Become a professional iOS Developer",
                    certificateLink: "https://somelink",
                    dateOfIssue: "Augst. 2021"),
                Certificate(title: "SwiftUI course",
                            company: "SwiftBook.ru",
                            certificateLink: "https://somelink",
                            dateOfIssue: "18 August 2021")
            ],
            hobby: "I like to travel, spend time with family, play cardboard games, watch movies and TV Shows")
    )
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed() {
        checkCredentials()
    }
    
    @IBAction func usernameHintButtonPressed() {
        showAlert(with: "Username hint:", and: user.username)
    }
    
    @IBAction func passwordHintButtonPressed() {
        showAlert(with: "Password hint:", and: user.password)
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
        return  username == user.username && password == user.password
    }
    
    private func checkCredentials() {
        if !isCredentialsCorrect() {
            showAlert(with: "Wrong credentials", and: "Please check your input")
            passwordTextField.text = ""
        } else {
            performSegue(withIdentifier: "toWelcomeVC", sender: nil)
        }
    }
}

// MARK: - Work with keyboard
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - Navigation
extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController,
              let viewControllers = tabBarController.viewControllers else { return }
        
        let person = user.personalInfo
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.fullName = "\(person.name) \(person.surname)"
            }  else if let workExperienceVC = viewController as? WorkExperienceViewController {
                workExperienceVC.certificates = person.courses
                workExperienceVC.workPlaces = person.workPlaces
            } else if let navController = viewController as? UINavigationController {
                navController.navigationBar.topItem?.title = "\(person.name) \(person.surname)"
                let personVC = navController.topViewController as! PersonalInfoViewController
                personVC.person = user.personalInfo
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
        usernameTextField.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}
