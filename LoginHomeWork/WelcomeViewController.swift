//
//  WelcomeViewController.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 24/08/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var welcomeUserLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: - Public properties
    var username: String?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 20
        setUpWelcomeMessage()
    }

    private func setUpWelcomeMessage() {
        guard let username = username else { return }
        welcomeUserLabel.text = String("Welcome, \(username)!")
    }

}
