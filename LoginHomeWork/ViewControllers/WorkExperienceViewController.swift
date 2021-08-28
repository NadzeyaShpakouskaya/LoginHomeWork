//
//  WorkExperienceViewController.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 28/08/2021.
//

import UIKit

class WorkExperienceViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var workDescriptionLabel: UILabel!
    @IBOutlet weak var certificatesDescriptionLabel: UILabel!
    
    // MARK: - Public properties
    var workPlaces: [WorkPlace]?
    var certificates: [Certificate]?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWorkInfo()
        setUpCertificatesInfo()
    }
    
    // MARK: - Private methods
    private func setUpWorkInfo() {
        guard let workPlaces = workPlaces else { return }
        var description = ""
        for place in workPlaces {
            let text =
            """
            \(place.company.capitalized)
            \(place.position)
            \(place.dateOfStart) - \(place.dateOfFinishing)
            \(place.description)
            =======================\n
            """
            description += text
        }
        workDescriptionLabel.text = description
    }
    
    
    private func setUpCertificatesInfo() {
        guard let certificateInfo = certificates else { return }
        var description = ""
        for certificate in certificateInfo {
            let text =
            """
            \(certificate.title)
            \(certificate.dateOfIssue)
            \(certificate.company)
            \(certificate.certificateLink)
            =======================\n
            """
            description += text
        }
        certificatesDescriptionLabel.text = description
    }
    

}
