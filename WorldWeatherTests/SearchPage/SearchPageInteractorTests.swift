//
//  SearchPageInteractorTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 9/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import WorldWeather

class SearchPageInteractorTests: XCTestCase {
    private var interactor: SearchPageInteractorInput?

    var recentCitiesExpectaion: XCTestExpectation?
    var gotoWeatherDetailsExpectation: XCTestExpectation?
    var searchResultsPresentedExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
        interactor = SearchPageInteractor(output: self, apiWorker: MockSearchAPIWorker())
    }

    func testRecentCitiesRetrieved() {
        let expectation = self.expectation(description: "present recent cities called")
        recentCitiesExpectaion = expectation
        interactor?.load()
        wait(for: [expectation], timeout: 2.0)
    }

    func testGotoWeatherDetails() {
        let expectation = self.expectation(description: "does go to weather details")
        gotoWeatherDetailsExpectation = expectation
        interactor?.load()
        interactor?.selectedArea(indexPath: IndexPath(row: 0, section: 0))
        wait(for: [expectation], timeout: 2.0)
    }


    func testThatSearchResultsArePresented() {
        let expectation = self.expectation(description: "does present search results")
        searchResultsPresentedExpectation = expectation
        interactor?.load()
        interactor?.searchFieldTextChanged(text: "search")
        interactor?.searchButtonClicked()
        wait(for: [expectation], timeout: 2.0)
    }

}

extension SearchPageInteractorTests: SearchPageInteractorOutput {
    func presentRecentCities(areas: [Area]) {
        recentCitiesExpectaion?.fulfill()
    }

    func presentSearchResults(areas: [Area]) {
        searchResultsPresentedExpectation?.fulfill()
    }

    func gotoWeatherDetails(for area: Area) {
        gotoWeatherDetailsExpectation?.fulfill()
    }

    func showLoading() {

    }

    func hideLoading() {

    }
}

class MockSearchAPIWorker: SearchPageAPIWorkerProtocol {
    func fetchSearchResults(for searchString: String, noOfResults: Int, completionHandler: @escaping (Response.Search?, Swift.Error?) -> Void) {
        do {
            let data = try Helpers.data(from: "mock-search", ext: "json")
            let searchResponse = try JSONDecoder().decode(Response.Search.self, from: data)
            completionHandler(searchResponse, nil)
            print(searchResponse)
            XCTAssert(searchResponse.results?.count != 0, "unable to parse search results")
        } catch {
            XCTFail(error.localizedDescription)
            completionHandler(nil, error)
        }
    }

}
