//
//  Adapter.swift
//  switui
//
//  Created by Abdur Rahim on 14/01/25.
//

import Foundation


/*
 Adapter pattern allows incompaitable interfaces to work together by converting one interface into another that a client expects
 */
//original Module
struct WeatherAPIResponse {
    let tempareture: Double
    let humidity: Double
}
//New model that we use in our app
struct Weather {
    let temp: Double
    let hum: Double
}

//Adapter that converts WeatherAPIResponse to Weather
class WeatherAdapter {
    func adapt(response:WeatherAPIResponse) -> Weather {
        return Weather(temp: response.tempareture, hum: response.humidity)
    }
}

