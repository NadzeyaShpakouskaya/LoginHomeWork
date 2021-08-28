//
//  CertificatesViewController.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 28/08/2021.
//

import UIKit

class CertificatesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var certificatesDescriptionLabel: UILabel!
    
    // MARK: - Public properties
    var certificates: [Certificate]?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCertificatesInfo()
    }
    
    // MARK: - IBActions
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private methods
    private func setUpCertificatesInfo() {
        guard let certificateInfo = certificates else { return }
        var description = ""
        for certificate in certificateInfo {
            let text =
            """
            \(certificate.title)
            
            Date of issue:\t\(certificate.dateOfIssue)
            Issued by:\t\(certificate.company)
            Link:\t\(certificate.certificateLink)
            \n=======================\n\n
            """
            description += text
        }
        certificatesDescriptionLabel.text = description
    }
}
