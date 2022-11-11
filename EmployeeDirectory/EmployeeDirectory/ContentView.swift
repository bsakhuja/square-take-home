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
            HStack {
                AsyncImage(url: URL(string: employee.photoUrlSmall ?? ""))
                VStack(alignment: .leading) {
                    Text(employee.fullName)
                        .font(.headline)
                    Text(employee.employeeType.stringValue)
                }
            }
                    
        }.task {
            await loadData()
        }
        .padding()
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
