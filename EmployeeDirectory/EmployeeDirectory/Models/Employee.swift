//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/10/22.
//

struct Employee: Codable {
    let uuid: String
    let fullName: String
    let phoneNumber: String?
    let emailAddress: String
    let biography: String?
    let photoUrlSmall: String?
    let photoUrlLarge: String?
    let team: String
    let employeeType: EmployeeType
}

extension Employee {
    enum CodingKeys: String, CodingKey {
        case uuid
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoUrlSmall = "photo_url_small"
        case photoUrlLarge = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}

enum EmployeeType: String, Codable, CodingKey {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
    
    func asString() -> String {
        switch self {
        case .fullTime: return "Full Time"
        case .partTime: return "Part Time"
        case .contractor: return "Contractor"
        }
    }
}
