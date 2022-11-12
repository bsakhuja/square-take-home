//
//  NetworkManager.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/10/22.
//

import Foundation

/// Network Manager
struct NetworkManager {
    let endpointURL = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    let malformedURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    let emptyURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    
    /// Get Employees
    /// - Returns: A list of employees parsed from the JSON response
    func getEmployees() async -> [Employee]? {
        guard let url = URL(string: endpointURL) else {
            print("Invalid URL")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(EmployeeResponse.self, from: data) {
                return decodedResponse.employees
            } else {
                print("Error parsing data")
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}


