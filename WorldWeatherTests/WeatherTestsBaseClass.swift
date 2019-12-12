//
//  BaseWeatherTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 10/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

// to provide commonly used methods
class WeatherTestsBaseClass: XCTestCase {

    func loadMockSearchData() throws -> Response.Search {
        let data = try Helpers.data(from: "mock-search", ext: "json")
        return try JSONDecoder().decode(Response.Search.self, from: data)
    }

    func loadMockWeatherData() throws -> Response.WeatherData{
        let data = try Helpers.data(from: "mock-weather", ext: "json")
        return try Response.WeatherData(data: data)
    }

    func mockArea(count: Int = 1) -> [Area] {
        var array = [Area]()

        for i in 0..<count {
            let area = Area(areaName: "area \(i)", country: "country \(i)", region: "region \(i)",
                latitude: Double((arc4random() % 10)) / 10.0,
                longitude: Double((arc4random() % 10)),
                weatherUrl: nil)

            array.append(area)
        }

        return array
    }
}
