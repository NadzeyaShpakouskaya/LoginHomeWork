//
//  ExperienceDetailedViewController.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 28/08/2021.
//

import UIKit

class ExperienceDetailedViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var workDescriptionLabel: UILabel!
    
    // MARK: - Public properties
    var workPlaces: [WorkPlace]?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWorkInfo()
    }
    
    // MARK: - IBActions
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private methods
    private func setUpWorkInfo() {
        guard let workPlaces = workPlaces else { return }
        var description = ""
        for place in workPlaces {
            let text =
            """
            Company:  \(place.company.capitalized)
            
            Position:  \(place.position)
            Period:  \(place.dateOfStart) - \(place.dateOfFinishing)
            
            Description:
            \(place.description)
            
            =======================\n\n
            """
            description += text
        }
        workDescriptionLabel.text = description
    }

}
