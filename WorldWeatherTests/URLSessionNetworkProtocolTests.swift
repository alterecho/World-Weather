//
//  URLSessionNetworkProtocolTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest

@testable import WorldWeather

class URLSessionNetworkProtocolTests: XCTestCase {

    func testThatURLSessionCallsCpmpletion() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 1.0
        config.timeoutIntervalForResource = 1.0
        let session = URLSession(configuration: config)
        let url = URL(string: "http://abc.com")!
        let expectation = self.expectation(description: "completion handler called expectation")
        session.downloadData(request: URLRequest(url: url)) { (data, response, error) in
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2.0, handler: nil)
    }
}
