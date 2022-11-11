//
//  NetworkManager.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/10/22.
//

import Foundation

struct NetworkManager {
    let endpointURL = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    let malformedURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    let emptyURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    
    let employees = [Employee]()
    
//    func getEmployees(with url: String) -> [Employee]? {
//        guard let url = URL(string: url) else { return nil }
//        let urlRequest = URLRequest(url: url)
//
//        Task {
//            do {
//                let data = try await perform(urlRequest)
//            } catch {
//                print("Error making the network request. \(error.localizedDescription)")
//            }
//        }
//
//        return nil
//    }
//
//    func perform(_ request: URLRequest) async throws -> Data {
//      let (data, response) =
//        try await URLSession.shared.data(for: request)
//      return data
//    }
}

struct Result: Codable {
    let employees: [Employee]?
}
