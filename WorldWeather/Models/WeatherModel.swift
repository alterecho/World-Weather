//
//  Weather.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

struct WeatherModel {
    let temperatureInCentigrade: Double
    let temperatureInFahrenheit: Double
    let humidity: Double
    let weatherDescription: String?
    var weatherIconURL: URL?
}
