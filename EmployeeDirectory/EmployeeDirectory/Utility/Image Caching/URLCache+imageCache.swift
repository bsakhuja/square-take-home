//
//  URLCache+imageCache.swift
//  EmployeeDirectory
//
//  Created by Brian Sakhuja on 11/13/22.
//

import Foundation

extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}
