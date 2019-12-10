//
//  WeatherDetailsPagePresenterTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 10/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class WeatherDetailsPagePresenterTests: WeatherTestsBaseClass {

    var presenter: WeatherDetailsPagePresenter?

    var displayVMCalledExpectation: XCTestExpectation?
    var showLoadingExpectation: XCTestExpectation?
    var hideLoadingExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
        presenter = WeatherDetailsPagePresenter(output: self)
    }

    func testVMIsDisplayed() {
        do {
            displayVMCalledExpectation = expectation(description: "vm is displayed expectation")
            let weatherData = try loadMockWeatherData()

            let mappingWorker = WeatherDetailsPageMappingWorker()
            
            if let weatherModel = mappingWorker.weather(from: weatherData) {
                presenter?.present(weather: weatherModel)

            } else {
                XCTFail("unable to load weather model")
            }

            waitForExpectations(timeout: 2.0)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    

    func testLoadingMethodsCalled() {
        showLoadingExpectation = expectation(description: "loading is shown expectation")
        hideLoadingExpectation = expectation(description: "loading is hidden expectation")
        presenter?.showLoading()
        presenter?.hideLoading()
        waitForExpectations(timeout: 1.0)

    }
}

extension WeatherDetailsPagePresenterTests:  WeatherDetailsPagePresenterOutput {
    func display(vm: WeatherDetailsPageViewModel) {
        displayVMCalledExpectation?.fulfill()
    }

    func showLoading() {
        showLoadingExpectation?.fulfill()
    }

    func hideLoading() {
        hideLoadingExpectation?.fulfill()
    }


}
