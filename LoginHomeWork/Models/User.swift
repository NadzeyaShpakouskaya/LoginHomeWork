//
//  User.swift
//  LoginHomeWork
//
//  Created by Nadzeya Shpakouskaya on 28/08/2021.
//

import Foundation

struct User {
    let username: String
    let password: String
    let personalInfo: Person
}

struct Person {
    let name: String
    let surname: String
    let sex: Gender
    let dateOfBirth: String
    let address: String
    let photoLink: String
    let contactInfo: ContactInfo
    let workPlaces: [WorkPlace]
    let education: [Education]
    let courses: [Certificate]
    let hobby: String
}
struct ContactInfo {
    let phoneNumber: String
    let email: String
}

struct WorkPlace {
    let company: String
    let position: String
    let dateOfStart: String
    let dateOfFinishing: String
    let description: String
}

struct Education {
    let name: String
    let levelDegree: LevelDegree
    var specialization: String = ""
    let dateOfStart: String
    let dateOfFinishing: String
}

struct Certificate {
    let title: String
    var company: String = ""
    let certificateLink: String
    let dateOfIssue: String
}

enum LevelDegree: String {
    case elementary = "Elementary"
    case highSchool = "High School"
    case associate = "Associate degree"
    case bachelor = "Bachelor's degree"
    case master = "Master's degree"
    case doctor = "Doctor's degree"
}

enum Gender {
    case male, female
}

