//
//  WeatherManager.swift
//  AppThree
//
//  Created by Meruert on 10.11.2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, with model: WeatherModel) 
    func didFailWithError(error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    
    func fetchRequest(){
        let link = "https://api.openweathermap.org/data/2.5/weather?lat=53.2871&lon=69.4044&units=metric&appid=f2d8ef06b5d230f94a05f458bb2e5534"
        guard let URL = URL(string: link) else {
            return
        }
        let task = URLSession.shared.dataTask(with: URL) { data, response, error in
            if let data, error == nil {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(WeatherData.self, from: data)
                    let cityName = decodedData.name
                    let temp = decodedData.main.temp
                    let desc = decodedData.weather[0].description
                    let maxTemp = decodedData.main.temp_max
                    let minTemp = decodedData.main.temp_min
                    let weatherModel = WeatherModel(cityName: cityName, temp: temp, description: desc, maxTemp: maxTemp, minTemp: minTemp)
                    delegate?.didUpdateWeather(self, with: weatherModel)
                }
                catch {
                    print("nothing has been decoded! \(error)")
                    return
                }
                print(data)
            } else {
                print("nothing has been retrieved")
            }
           
            
            
        }
        task.resume()
    }
}
