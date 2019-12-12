//
//  SearchPagePresenterTests.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

import XCTest
@testable import WorldWeather

class SearchPagePresenterTests: WeatherTestsBaseClass {

    var presenter: SearchPagePresenter?

    var vmPresentdExpectation: XCTestExpectation?
    var routeToWeatherDetailsExpectation: XCTestExpectation?
    var showLoadingExpectation: XCTestExpectation?
    var hideLoadingExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
        presenter = SearchPagePresenter(output: self)
    }

    func testRecentResultsPresented() {
        vmPresentdExpectation = expectation(description: "recent resulkts are displayed expectation")
        presenter?.presentRecentCities(areas: mockAreaArray())
        waitForExpectations(timeout: 2.0)
    }


    func testSearchResultsPresented() {
        vmPresentdExpectation = expectation(description: "searchResults are displayed expectation")
        presenter?.presentSearchResults(areas: mockAreaArray())
        waitForExpectations(timeout: 2.0)

    }

    func testRoutingToWeatherDetailsExpectation() {
        vmPresentdExpectation = expectation(description: "searchResults are displayed expectation")
        presenter?.presentSearchResults(areas: mockAreaArray())
        waitForExpectations(timeout: 2.0)

    }


    func testLoadingMethodsCalled() {
        showLoadingExpectation = expectation(description: "loading is shown expectation")
        hideLoadingExpectation = expectation(description: "loading is hidden expectation")
        presenter?.showLoading()
        presenter?.hideLoading()
        waitForExpectations(timeout: 1.0)

    }
}

extension SearchPagePresenterTests:  SearchPagePresenterOutput {
    func display(vm: SearchPageViewModel) {
        vmPresentdExpectation?.fulfill()
    }

    func gotoWeatherDetails(area: Area) {
        routeToWeatherDetailsExpectation?.fulfill()
    }

    func showAlert(title: String?, message: String) {

    }

    func showLoading() {
        showLoadingExpectation?.fulfill()
    }

    func hideLoading() {
        hideLoadingExpectation?.fulfill()
    }


}

