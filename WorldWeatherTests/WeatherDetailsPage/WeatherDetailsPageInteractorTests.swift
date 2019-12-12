//
//  WeatherDetailsPageInteractorTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 9/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class WeatherDetailsPageInteractorTests: WeatherTestsBaseClass {
    private var interactor: WeatherDetailsPageInteractor?
    var presentWeatherExpectation: XCTestExpectation?
    var showLoadingExpectation: XCTestExpectation?
    var hideLoadingExpectation: XCTestExpectation?

    override func setUp() {
        let apiWorker = MockAPIWorker()
        interactor = WeatherDetailsPageInteractor(output: self, apiWorker: apiWorker)
    }

    func testThatPresentMethodIsCalled() {
        presentWeatherExpectation = self.expectation(description: "does present weather details expectation")

        showLoadingExpectation = self.expectation(description: "does show loading expectation")

        hideLoadingExpectation = self.expectation(description: "does hide loading expectation")

        let area = Area(areaName: "area", country: "country", region: "region", latitude: 0.0, longitude: 0.0, weatherUrl: nil)
        interactor?.load(area: area)
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
}

extension WeatherDetailsPageInteractorTests:  WeatherDetailsPageInteractorOutput {
    func showAlert(title: String?, message: String) {
        
    }

    func present(weather: WeatherModel?) {
        presentWeatherExpectation?.fulfill()
    }

    func showLoading() {
        showLoadingExpectation?.fulfill()
    }

    func hideLoading() {
        hideLoadingExpectation?.fulfill()
    }
}

private class MockAPIWorker: WeatherDetailsPageAPIWorkerProtocol {
    func downloadData(url: URL, completionHandler: @escaping (Data?, Swift.Error?) -> Void) {
        DispatchQueue.main.async {
            completionHandler(nil, nil)
        }
    }

    func fetchWeatherDetails(location: Location, numberOfDays: Int, completionHandler: @escaping (Response.WeatherData?, Swift.Error?) -> Void) {

        do {
            let data = try Helpers.data(from: "mock-weather", ext: "json")
            let response = try Response.WeatherData(data: data)
            completionHandler(response, nil)
        } catch {
            completionHandler(nil, error)
        }
    }



}
