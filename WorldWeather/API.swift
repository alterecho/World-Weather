//
//  URLStrings.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class API {
    private static let baseURLString = "https://api.worldweatheronline.com"
    private static let searchPath = "premium/v1/search.ashx"
    private static let weatherPath = "premium/v1/weather.ashx"
    private static let apiKey =  "367138cc77944a87b6502551190612"

    static func searchURL(for string: String, noOfResults: Int) -> URL? {
        return URL(string: "\(baseURLString)/\(searchPath)?query=\(string)&format=json&num_of_results=\(noOfResults)&key=\(apiKey)")
    }

    static func weatherDataURL(lat: Double, lon: Double, numberOfDays: Int) -> URL? {
        return URL(string: "\(baseURLString)/\(weatherPath)?q=\(lat),\(lon)&num_of_days=\(numberOfDays)&key=\(apiKey)&format=json")
    }
}
