//
//  EducationViewController.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 28/08/2021.
//

import UIKit

class EducationViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var educationInfoLabel: UILabel!
    
    // MARK: - Public properties
    var educationInfo: [Education]?

    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpEducationInfo()
    }
    
    // MARK: - Private methods
    private func setUpEducationInfo() {
        guard let degrees = educationInfo else { return }
        var description = ""
        for degree in degrees {
            let text =
            """
            
            \(degree.name)
            Period:\t\(degree.dateOfStart) - \(degree.dateOfFinishing)
            
            Specialization:\t\(degree.specialization)
            Level:\t\(degree.levelDegree.rawValue)
            
            =======================
            
            """
            description += text
        }
        educationInfoLabel.text = description
    
    }
}
