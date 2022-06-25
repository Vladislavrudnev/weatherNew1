//
//  NetworkWeatherManager.swift
//  weather
//
//  Created by владислав Руднев on 15.05.2022.
//

import Foundation

struct NetworkWeatherManager {
    
    var onComletion: ((CurrentWeather) -> Void)?
    
    func fetch (forCity city: String) {
        let uerstring = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apikey)&units=metric"
        guard  let url = URL(string: uerstring) else {return}
         let session = URLSession(configuration: .default)
         
         let task = session.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let currentWeather = self.parseJsSON(withData: data){
                     self.onComletion?(currentWeather)
                     
                 }
             }
         }
        task.resume()
        
    }
    func parseJsSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
          let currentWeatherData =  try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
