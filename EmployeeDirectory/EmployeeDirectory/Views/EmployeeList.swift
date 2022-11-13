//
//  EmployeeList.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/11/22.
//

import SwiftUI

/// Employee List
struct EmployeeList: View {
    
    @Binding var employeeList: [Employee]?
    
    var body: some View {
        if let employeeList = employeeList, employeeList.count > 0 {
            List(employeeList, id: \.uuid) { employee in
                EmployeeCell(employee: employee)
            }
        } else if employeeList == nil {
            List {
                Text("Error getting employees. Try again.")
            }
        } else if employeeList?.count == 0 {
            List {
                Text("No employees.")
            }
        }
    }
}

// MARK: - Previews

struct EmployeeList_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeList(employeeList: .constant([
            Employee(
                uuid: "0d8fcc12-4d0c-425c-8355-390b312b909c",
                fullName: "Justine Mason",
                phoneNumber: "5553280123",
                emailAddress: "jmason.demo@squareup.com",
                biography: "Engineer on the Point of Sale team.",
                photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg",
                photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg",
                team: "Point of Sale",
                employeeType: .fullTime),
        ]))
    }
}
