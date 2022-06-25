//
//  View Controller + Alert.swift
//  weather
//
//  Created by владислав Руднев on 15.05.2022.
//

import Foundation
import UIKit

extension ViewController {
    func presentCearchAlertController(withtitle  title:String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping( String)-> Void ){
        let ac = UIAlertController.init(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["san francisco, moscow, omsk"]
            tf.placeholder = cities.randomElement()
        }
       
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
               
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
