//
//  WeatherDetailsPageAPIWorker.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPageAPIWorker: WeatherDetailsPageAPIWorkerProtocol {

    let network: NetworkProtocol

    init(network: NetworkProtocol = URLSession.shared) {
        self.network = network
    }

    func fetchWeatherDetails(location: Location, numberOfDays: Int, completionHandler: @escaping (Response.WeatherData?, Swift.Error?) -> Void) {
        guard let url = API.weatherDataURL(lat: location.latitude, lon: location.Longitude, numberOfDays: 5) else {
            AlertSystem.alert(title: "Error", message: "Error forming URL for search")
            return
        }
        let request = URLRequest(url: url)
        network.downloadData(request: request) { (data, response, error) in
            var weatherData: Response.WeatherData? = nil
            var returnError = error
            if let data = data {
                do {
                    weatherData = try Response.WeatherData(data: data)
                } catch {
                    returnError = error
                }
            }
            DispatchQueue.main.async {
                completionHandler(weatherData, returnError)
            }

        }
    }

    func downloadData(url: URL, completionHandler: @escaping (Data?, Swift.Error?) -> Void) {
        let request = URLRequest(url: url)
        network.downloadData(request: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completionHandler(data, error)
            }
        })
    }


}
