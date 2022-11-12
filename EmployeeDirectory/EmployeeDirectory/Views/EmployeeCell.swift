//
//  EmployeeCell.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/10/22.
//

import SwiftUI

/// Employee Cell
struct EmployeeCell: View {
    let employee: Employee
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: employee.photoUrlSmall ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75.0, height: 75)
                            .cornerRadius(75.0)
                    } else if phase.error != nil {
                        Image("silhouette")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75.0, height: 75.0)
                            .cornerRadius(75.0)
                    } else {
                        ProgressView()
                    }
                }
                Spacer()
                Text(employee.fullName)
                    .font(.headline)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Team")
                        .font(.caption)
                    Spacer()
                    Text(employee.team)
                }
                HStack {
                    Text("Employee type")
                        .font(.caption)
                    Spacer()
                    Text(employee.employeeType.asString())
                }
                HStack {
                    Text("Email")
                        .font(.caption)
                    Spacer()
                    Text(.init("[\(employee.emailAddress)](mailto://\(employee.emailAddress))"))
                }
                if let phone = employee.phoneNumber {
                    HStack {
                        Text("Phone")
                            .font(.caption)
                        Spacer()
                        Text(.init("[\(phone)](tel://\(phone))"))
                    }
                    
                }
                if let biography = employee.biography {
                    HStack(alignment: .top) {
                        Text("Bio")
                            .font(.caption)
                        Spacer()
                        Text(biography)
                            .font(.subheadline)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
            }
        }
    }
}

// MARK: - Previews

struct EmployeeCell_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeCell(employee: Employee(
            uuid: "0d8fcc12-4d0c-425c-8355-390b312b909c",
            fullName: "Justine Mason",
            phoneNumber: "5553280123",
            emailAddress: "jmason.demo@squareup.com",
            biography: "Engineer on the Point of Sale team.",
            photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg",
            photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg",
            team: "Point of Sale",
            employeeType: .fullTime))
    }
}
