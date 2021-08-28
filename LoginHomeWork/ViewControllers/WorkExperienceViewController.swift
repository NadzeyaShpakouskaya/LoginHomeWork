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
            Company: \(place.company.capitalized)
            
            Position: \(place.position)
            Period: \(place.dateOfStart) - \(place.dateOfFinishing)
            Description: \(place.description)
            
            =======================
            
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
            Date of issue: \(certificate.dateOfIssue)
            Issued by: \(certificate.company)
            Link: \(certificate.certificateLink)
            
            =======================
            
            """
            description += text
        }
        certificatesDescriptionLabel.text = description
    }
    

}
