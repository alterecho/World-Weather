//
//  SearchPageRouterTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class SearchPagePageRouterTests: WeatherTestsBaseClass {

    var router: SearchPagePageRouter?

    override func setUp() {
//        let viewController = UIStoryboard(
//            name: "Main", bundle: Bundle(for: type(of: self)))
//            .instantiateViewController(identifier: StoryboardIDs.searchPage)

        let viewController = SearchPageViewController()

//        guard viewController != nil else {
//            XCTFail("Unable to load SearchPageViewController")
//            return
//        }
        router = SearchPagePageRouter(viewController: viewController)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    var goesToDetailsPageExpectation: XCTestExpectation?

    func testRoutingToDetailsPage() {
//        goesToDetailsPageExpectation = expectation(description: "go to details page")
        if let area = mockArea().first {
            router?.gotoWeatherDetails(area: area)
//            waitForExpectations(timeout: 2.0, handler: nil)
        } else {
//            XCTFail("check mockArea() method")
        }
    }
}
