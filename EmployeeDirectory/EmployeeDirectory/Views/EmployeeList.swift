//
//  EmployeeList.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/11/22.
//

import SwiftUI

/// Employee List
struct EmployeeList: View {
    
    var employeeList: [Employee]?
    
    var body: some View {
        if let employees = employeeList {
            
            List(employees, id: \.uuid) { employee in
                EmployeeCell(employee: employee)
            }
            .listStyle(.grouped)
        } else {
            Text("Loading employees...")
            ProgressView()
                .controlSize(.large)
        }
    }
}

// MARK: - Previews

struct EmployeeList_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeList()
    }
}
