//
//  EmployeeDirectoryTests.swift
//  EmployeeDirectoryTests
//
//  Created by Brian Sakhuja on 11/10/22.
//

import XCTest
@testable import EmployeeDirectory

final class EmployeeDirectoryTests: XCTestCase {
    
    /// Test Valid Employees List
    /// For now, naïvely assume that a valid employees list can be parsed to a non-empty Employees list (e.g. employeeList is not empty)
    func testValidEmployeesList() throws {
        do {
            let employeesData = try getData(fromJSON: MockData.employees.rawValue)
            let employeesParsed = try JSONDecoder().decode(EmployeeResponse.self, from: employeesData)
            let employeeList = employeesParsed.employees
            
            XCTAssertNotNil(employeeList)
            guard let employeeList = employeeList else {
                throw UnitTestError.employeeListNil
            }
            
            XCTAssert(!employeeList.isEmpty)
        } catch {
            throw error
        }
    }
    
    /// Test Empty Employees List
    /// An empty employees list should be parsed to an empty list (e.g. '[Employees]()')
    func testEmptyEmployeesList() throws {
        do {
            let emptyEmployeesData = try getData(fromJSON: MockData.empty.rawValue)
            let emptyEmployeesParsed = try JSONDecoder().decode(EmployeeResponse.self, from: emptyEmployeesData)
            let employeeList = emptyEmployeesParsed.employees
            
            XCTAssertNotNil(employeeList)
            guard let employeeList = employeeList else {
                throw UnitTestError.employeeListNil
            }
            
            XCTAssert(employeeList.isEmpty)
        } catch {
            throw error
        }
        
    }
    
    /// Test Malformed Employees List
    /// Trying to parse a malformed employees list should throw an error
    func testMalformedEmployeesList() throws {
        do {
            let malformedEmployeesData = try getData(fromJSON: MockData.malformed.rawValue)
            XCTAssertThrowsError(try JSONDecoder().decode(EmployeeResponse.self, from: malformedEmployeesData))
        } catch {
            throw error
        }
    }
}
