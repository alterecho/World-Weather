//
//  AlertSystemTests.swift
//  WorldWeatherUITests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest

class AlertSystemTests: XCTestCase {

    var application: XCUIApplication?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        application = XCUIApplication()


        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testAlertIsShown() {
        application?.launchArguments.append(LaunchArgs.testAlert)
        application?.launch()

        let query = application?.alerts[AccesssibilityIDs.alertSystem]
        XCTAssert(query?.waitForExistence(timeout: 5.0) ?? false)
        
    }
}
