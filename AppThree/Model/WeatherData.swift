//
//  WeatherData.swift
//  AppThree
//
//  Created by Meruert on 10.11.2022.
//

import Foundation

struct WeatherData: Decodable {
    
    let weather: [Weather]
    let main: MainData
    let name: String
    
  
}
struct Weather: Decodable {
    let id:  Int
    let main: String
    let description: String
}

struct MainData: Decodable {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
}
