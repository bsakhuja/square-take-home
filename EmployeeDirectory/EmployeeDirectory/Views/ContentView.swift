//
//  ContentView.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var employeeList: [Employee]?
    
    private let networkManager = NetworkManager()
    var body: some View {
        VStack {
            EmployeeList(employeeList: employeeList)
                .task {
                    await refreshEmployees()
                }
                .refreshable {
                    await refreshEmployees()
                }
        }
        
    }
}

// MARK: - Private

private extension ContentView {
    
    func refreshEmployees() async {
        employeeList = await networkManager.getEmployees()
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// TODO: handle malformed data
// TODO: handle empty response
// TODO: write tests
// TODO: fill out readme
