//
//  WeatherDetailsPageAPIWorkerTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class WeatherDetailsPageAPIWorkerTests: WeatherTestsBaseClass {

    var apiWorker: WeatherDetailsPageAPIWorkerProtocol?
    var mockNetwork: MockNetwork?

    override func setUp() {
        let mockNetwork = MockNetwork()
        self.mockNetwork = mockNetwork
        apiWorker = WeatherDetailsPageAPIWorker(network: mockNetwork)
    }

    func testThatDataIsDownloaded() {
        let expectation = self.expectation(description: "download expectation")
        mockNetwork?.filename = "mock-search.json"
        apiWorker?.downloadData(url: URL(string: "http://test.com")!, completionHandler: { (data, error) in
            if data != nil {
                expectation.fulfill()
            } else {
                XCTFail("failed downloading")
            }
        })
        waitForExpectations(timeout: 2.0, handler: nil)
    }

    func testThatWeatherDetailsAreFetched() {
        let expectation = self.expectation(description: "weather is fetched expectation")
        mockNetwork?.filename = "mock-weather.json"
        apiWorker?.fetchWeatherDetails(location: Location(latitude: 0, Longitude: 0), numberOfDays: 1, completionHandler: { (weatherDataResponse, error) in
            if let _ = weatherDataResponse {
                expectation.fulfill()
            } else {
                XCTFail(error?.localizedDescription ?? "failed fetching weather")
            }
        })
        waitForExpectations(timeout: 2.0, handler: nil)
    }
}
