//
//  WorldWeatherTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 5/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class ResponseDecodingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testSearchResultsDecoding() {
        do {
            let data = try Helpers.data(from: "mock-search", ext: "json")
            let searchResponse = try JSONDecoder().decode(Response.Search.self, from: data)
            print(searchResponse)
            XCTAssert(searchResponse.results?.count != 0, "unable to parse search results")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
