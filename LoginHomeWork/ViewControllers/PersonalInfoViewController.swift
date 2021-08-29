//
//  PersonalInfoViewController.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 28/08/2021.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    
    @IBOutlet weak var educationDetailedButton: UIButton!
    
    // MARK: - Public properties
    var person: Person!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        educationDetailedButton.layer.cornerRadius = 10
        
        photo.image = UIImage(named: person.photoLink ?? "person.fill")
        photo.layer.cornerRadius = 10
        
        setUpLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let educationVC = segue.destination as? EducationViewController {
            educationVC.educationInfo = person?.education
        }
    }
    
    // MARK: - Private methods
    
    private func setUpLabels() {
        dateOfBirthLabel.text = person.dateOfBirth
        addressLabel.text = person.address
        genderLabel.text = person.sex.rawValue
        phoneLabel.text = person.contactInfo.phoneNumber
        emailLabel.text = person.contactInfo.email
        educationLabel.text = setUpEducationInfo()
        hobbyLabel.text = person.hobby
        
    }
    
    private func setUpEducationInfo() -> String? {
        var description = ""
        if let degrees = person.education {
            
            for degree in degrees {
                let text = "\n\(degree.name), \(degree.specialization)\n"
                description += text
            }
        }
        return description
    }
    
}
