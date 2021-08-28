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
    
    @IBOutlet weak var experienceDetailedButton: UIButton!
    @IBOutlet weak var certificateDetailedButton: UIButton!
    
    // MARK: - Public properties
    var workPlaces: [WorkPlace]?
    var certificates: [Certificate]?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWorkInfo()
        setUpCertificatesInfo()
        setUpButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let workVC = segue.destination as? ExperienceDetailedViewController {
            workVC.workPlaces = workPlaces
        } else if let certificatesVC = segue.destination as? CertificatesViewController {
            certificatesVC.certificates = certificates
        }
    }
    
    // MARK: - Private methods
    private func setUpWorkInfo() {
        guard let workPlaces = workPlaces else { return }
        var description = ""
        for place in workPlaces {
            let text =
            """
            ►\tCompany:\t\(place.company.capitalized)
            \tPosition:\t\(place.position)
            \n
            """
            description += text
        }
        workDescriptionLabel.text = description
    }
    
    
    private func setUpCertificatesInfo() {
        guard let certificateInfo = certificates else { return }
        var description = ""
        for certificate in certificateInfo {
            let text = " • \(certificate.title)\n"
            description += text
        }
        certificatesDescriptionLabel.text = description
    }
    
    private func setUpButtons() {
        experienceDetailedButton.layer.cornerRadius = 10
        certificateDetailedButton.layer.cornerRadius = 10
    }
}
