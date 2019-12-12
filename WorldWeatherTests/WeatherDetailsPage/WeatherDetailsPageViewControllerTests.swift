//
//  WeatherDetailsPageViewControllerTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class WeatherDetailsPageViewControllerTests: XCTestCase {
    var viewController: WeatherDetailsPageViewController?
    override func setUp() {
        super.setUp()

        viewController = WeatherDetailsPageViewController()
        _ = viewController?.view
    }

    func testViewLoaded() {
        // to implement
    }
}
