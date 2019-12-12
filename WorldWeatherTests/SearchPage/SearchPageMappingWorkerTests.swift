//
//  SearchPageMappingWorkerTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class SearchPageMappingWorkerTests: WeatherTestsBaseClass {
    var mappingWorker: SearchPageMappingWorkerProtocol?

    override func setUp() {
        super.setUp()

        mappingWorker = SearchPageMappingWorker()
    }

    func testAreasMapping() {
        do {
            let searchResponse = try loadMockSearchData()
            let areas = mappingWorker?.areasFrom(response: searchResponse) ?? []
            XCTAssert(areas.count == (searchResponse.results?.count ?? 0), "result mismatch")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
