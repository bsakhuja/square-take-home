//
//  ContentView.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var employees: [Employee] = [Employee]()
    var body: some View {
        List(employees, id: \.uuid) { employee in
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
                    
        }.task {
            await loadData()
        }
        .refreshable {
            await loadData()
        }
        .listStyle(.grouped)
    }
    
    func loadData() async {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            print(data)
            if let decodedResponse = try? JSONDecoder().decode(Result.self, from: data) {
                employees = decodedResponse.employees ?? [Employee]()
            }
        } catch {
            print("Invalid data")
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
