//
//  EmployeeType.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/11/22.
//

/// Employee Type
enum EmployeeType: String, Codable, CodingKey {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
    
    /// As String
    /// - Returns: A readable string representing the employee type
    func asString() -> String {
        switch self {
        case .fullTime: return "Full Time"
        case .partTime: return "Part Time"
        case .contractor: return "Contractor"
        }
    }
}
