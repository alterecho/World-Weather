//
//  DataStoreTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class DataStoreTests: XCTestCase {
    func testRecentsAreStored() {
        var areas = [Area]()
        let count = 10
        for i in 0..<count {
            areas.append(getTestArea(index: i))
        }

        do {
            try DataStore.shared.saveRecents(areas: areas)
            let retrievedData = try DataStore.shared.loadRecents()
            XCTAssert(retrievedData?.count == count, "Only retrieved \(retrievedData?.count ?? 0)")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func getTestArea(index i: Int) -> Area {
        return Area(
        areaName: "\(i)", country: "country\(i)", region: "country\(i)",
            latitude: Double(i), longitude: Double(i), weatherUrl: URL(string: "http://domain\(i).com")
        )

    }
}
