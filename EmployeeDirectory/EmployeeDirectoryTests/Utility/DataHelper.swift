//
//  DataHelper.swift
//  EmployeeDirectoryTests
//
//  Created by Brian Sakhuja on 11/13/22.
//

import Foundation
import XCTest

extension XCTestCase {
    
    /// Get Data from JSON
    /// A helper for unit tests to get the raw Data from the JSON files
    /// - Parameters:
    ///   - name: Name of the file
    /// - Returns: Data
    func getData(fromJSON fileName: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName).json")
            throw UnitTestError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
    
    
}
