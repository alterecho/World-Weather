//
//  WeatherDetailsPageConfiguratorTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class WeatherDetailsPageConfiguratorTests: XCTestCase {

    func testThatVCIsConfigured() {
        let viewController = WeatherDetailsPageViewController()
        let configurator = WeatherDetailsPageConfigurator()

        configurator.configure(viewController: viewController)

        XCTAssert(viewController.output != nil, "interactor not set for view controller")
    }
}
