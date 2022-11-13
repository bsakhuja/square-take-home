//
//  ContentView.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/10/22.
//

import SwiftUI

/// Content View
struct ContentView: View {
    
    // MARK: Private Properties
    
    @State private var employeeList: [Employee]?
    private let networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                EmployeeList(employeeList: $employeeList)
                    .task {
                        await refreshEmployees()
                    }
                    .refreshable {
                        await refreshEmployees()
                    }
                    .navigationTitle("Block Employees")
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
