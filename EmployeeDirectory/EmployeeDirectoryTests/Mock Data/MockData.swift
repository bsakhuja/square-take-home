//
//  MockData.swift
//  EmployeeDirectoryTests
//
//  Created by Brian Sakhuja on 11/13/22.
//

import Foundation

/// Mock Data
/// Used to easily get the JSON filenames for each mock data type
enum MockData: String {
    case employees = "employees"
    case empty = "employees_empty"
    case malformed = "employees_malformed"
}
