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
    var fullName: String!
    
    // MARK: - Private properties
    private var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor]
        }
    }
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 20
        
        // gradient
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        setUpWelcomeMessage()
    }
    
    override func viewDidLayoutSubviews() {
        let width = self.view.bounds.size.width
        let height = self.view.bounds.size.height
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    // MARK: - Private methods
    private func setUpWelcomeMessage() {
//        guard let name = fullName else { return }
        welcomeUserLabel.text = "Welcome, " + fullName + " !"
    }
}
