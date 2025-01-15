//
//  Proxy.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation
/*
 The proxy pattern provides a surrogate or placeholder for another object. It can be used to control access to the original object
 */
class Service {
    func fetchData() -> String {
        return "Fetched data from server"
    }
}
//Proxy that caches the result
class CaachingProxy {
    private let service = Service()
    private var cachedData: String?
    func fetchData() -> String {
        if let data = cachedData {
            print("Fetch from Cache")
            return data //Return cached data
        } else  {
            print("Fetch from server")
            let data = service.fetchData()
            cachedData = data
            return data
        }
    }
}
