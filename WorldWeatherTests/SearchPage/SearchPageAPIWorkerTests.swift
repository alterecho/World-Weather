//
//  SearchPageAPIWorkerTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class SearchPageAPIWorkerTests: XCTestCase {

    var apiWorker: SearchPageAPIWorkerProtocol?
    var mockNetwork: MockNetwork?

    override func setUp() {
        let mockNetwork = MockNetwork()
        self.mockNetwork = mockNetwork
        apiWorker = SearchPageAPIWorker(network: mockNetwork)
    }

    func testThatWeatherDetailsAreFetched() {
        let expectation = self.expectation(description: "search results are fetched expectation")
        mockNetwork?.filename = "mock-search.json"
        apiWorker?.fetchSearchResults(for: "search", noOfResults: 1, completionHandler: { (searchResponse, error) in
            if let _ = searchResponse {
                expectation.fulfill()
            } else {
                XCTFail(error?.localizedDescription ?? "failed fetching weather")
            }
        })
        waitForExpectations(timeout: 2.0, handler: nil)
    }

}
