//
//  OperatorsUse.swift
//  switui
//
//  Created by Abdur Rahim on 07/01/25.
//

import Foundation
import Combine
struct User {
    var id:Int
    var name:String
    var isActive: Bool
    
}

struct OperatorsUse {
    
    //Transforming Opertaor
    func useMap()  {
        Just("123")
            .map{ Int($0) }
            .sink {
                print("converted value \($0)")
                
            }
    }
    
    func useScan()  {
        let cartPrice = [10,20,30,40].publisher
        cartPrice
            .scan(0) { total, value in total+value }
            .sink{
                print("Total amount : \($0)")
            }
    }
    
//    func useMapGeneric<T:Any,U:Any>(input:T) -> U {
//        Just(input)
//            .map{ U($0) }
//            .sink { 
//                print("converted value \($0)")
//                return $0
//            }
//    }
    
    //Filtering Operator
    func useFilter() {
        let users = [
            User(id:1, name: "John", isActive:true),
            User(id:2, name: "vaughn", isActive:false)
        ]
            .publisher
        users
            .filter { $0.isActive }
            .sink { print("Active users : \($0)")}
    }
    func useRemoveDuplicates() {
        let locations = ["Home","Home","Office", "Gym", "Office", "Home"]
            .publisher
        locations.removeDuplicates()
            .sink {
                print("Current locations: \($0)")
            }
    }
    func useFirst() {
        let tasks = ["Low", "Medium", "High", "Low"]
            .publisher
        tasks
            .first{ $0 == "High" }
            .sink {
                print("First High priority task: \($0)")
            }
    }
    
    //Combining Operators
    
    func useMerge() {
        let chat1 = ["hi","How are you ?"].publisher
        let chat2 = ["Hello","I am Good"].publisher
        chat1
            .merge(with: chat2)
            .sink {
                print("Chat message \($0)")
            }
    }
    
    func useCombineLatest() {
        let tempareture = CurrentValueSubject<Int, Never>(25)
        let condition = CurrentValueSubject<String, Never>("Sunny")
        
        tempareture
            .combineLatest(condition)
            .sink {
                temp, cond in
                print("Weather: \(temp)C and  \(cond)")
                
            }
        tempareture.send(30)
        condition.send("Cloudy")
    }
    
    func useZip() {
        let names = ["John", "Jane"].publisher
        let ages = [25,30].publisher
        names
            .zip(ages)
            .sink {
                name, age in
                print("User: \(name), age \(age)")
            }
    }
    
    //Error Handling operator
    //Functions are comment out as realworld sceanrio not here
    /*
    func useCatch() {
        let apiRequest = Fail <Int, URLError>(error: URLError(.badServerResponse))
        apiRequest
            .catch { _in Just(0)}
            .sink{
                print("Fetched data: \($0)")
            }
    }
    
    func useRetry() {
        let failingPublisher = Fail <Int, URLError>(error: URLError(.timedOut))
        failingPublisher
            .retry(3)
            .catch { _in Just(-1)}
            .sink{
                print("Fetched data: \($0)")
            }
    }
     */
    
    
    //Time Manipulation Operators
    func useDebounce() {
        let searchTerms = PassthroughSubject<String, Never>()
        searchTerms
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink {
                print("Searching for: \($0)")
            }
        searchTerms.send("Acc")
        searchTerms.send("Account")
    }
    
    func useThrottle() {
        let gpsUpdates = PassthroughSubject<String, Never>()
        gpsUpdates
            .throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true)
            .sink {
                print("GPS Update: \($0)")
            }
        gpsUpdates.send("Location 1")
        gpsUpdates.send("Location 2")
        gpsUpdates.send("Location 3")
    }
}
