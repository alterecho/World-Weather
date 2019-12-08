//
//  WeatherDetailsPageMappingWorker.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPageMappingWorker: WeatherDetailsPageMappingWorkerProtocol {
    func weather(from response: Response.WeatherData) -> WeatherModel? {
        guard let currentCondition = response.currentCondition?.first else {
            return nil
        }

        let weatherModel = WeatherModel(
            temperatureInCentigrade: value(currentCondition.temperatureInCentigrade),
            temperatureInFahrenheit: value(currentCondition.temperatureInFahrenheit),
            humidity: value(currentCondition.humidity),
            weatherDescription: currentCondition.weatherDescription?.value,
            weatherIconURL: URL(string: currentCondition.weatherIconURL?.value ?? "")
        )

        return weatherModel
    }

    private func value(_ string: String?) -> Double {
        return Double(string ?? "") ?? 0.0
    }
}
