//
//  WeatherDetailsPageAPIWorker.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPageAPIWorker: WeatherDetailsPageAPIWorkerProtocol {
    let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchWeatherDetails(location: Location, numberOfDays: Int, completionHandler: @escaping (Response.WeatherData?, Swift.Error?) -> Void) {
        guard let url = API.weatherDataURL(lat: location.latitude, lon: location.Longitude, numberOfDays: 5) else {
            AlertSystem.alert(title: "Error", message: "Error forming URL for search")
            return
        }
        let request = URLRequest(url: url)
        session.dataTask(with: request) { (data, response, error) in
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
        }.resume()

        
    }
        
}
