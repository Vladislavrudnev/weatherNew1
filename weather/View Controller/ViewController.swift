//
//  ViewController.swift
//  weather
//
//  Created by владислав Руднев on 15.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var temperaruraLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var LikeTemperaturaLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    

    @IBAction func SearchPressed(_ sender: UIButton) {
        self.presentCearchAlertController(withtitle: "Enter city name", message: nil, style: .alert) {[unowned self] city in
            self.networkWeatherManager.fetch(forCity: city)
            }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onComletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWich(weather: currentWeather)
        }
        networkWeatherManager.fetch(forCity: "London")
        
    }
    
    func updateInterfaceWich(weather: CurrentWeather) {
        DispatchQueue.main.async {
            
        self.cityLabel.text = weather.cityName
        self.temperaruraLabel.text = weather.temperatureString
        self.LikeTemperaturaLabel.text = weather.feelsLikeTemperatuteString
        }
    }
}


