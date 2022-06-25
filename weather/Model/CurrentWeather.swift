//
//  CurrentWeather.swift
//  weather
//
//  Created by владислав Руднев on 15.05.2022.
//

import Foundation
import UIKit
struct CurrentWeather {
    let cityName: String
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let feelsLikeTemperatute:Double
    var feelsLikeTemperatuteString: String {
        return String(format: "%.0f", feelsLikeTemperatute)
    }
    let ConditionCode: Int
        
        init?(currentWeatherData: CurrentWeatherData) {
            cityName = currentWeatherData.name
            temperature = currentWeatherData.main.temp
            feelsLikeTemperatute = currentWeatherData.main.feelsLike
            ConditionCode = currentWeatherData.weather.first!.id
        }
}

