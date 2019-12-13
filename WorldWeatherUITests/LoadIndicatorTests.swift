//
//  LoadIndicatorTests.swift
//  WorldWeatherUITests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
//@testable import WorldWeather

class LoadIndicatorTests: XCTestCase {

    var application: XCUIApplication?
    override func setUp() {
        continueAfterFailure = false
        application = XCUIApplication()
    }

    func testActivityIndicatorIsShownAndHidden() {
        guard let app = application else {
            XCTFail("check 'application'")
            return
        }
        app.launchArguments.append(LaunchArgs.testLoadIndicator)
        app.launch()

        let loadIndicator = app.activityIndicators[AccesssibilityIDs.loadIndicator]
        XCTAssert(loadIndicator.waitForExistence(timeout: 5.0), "loadIndicator not shown")
    }

}
