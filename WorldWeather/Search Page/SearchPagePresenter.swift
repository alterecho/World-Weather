//
//  SearchPagePresenter.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class SearchPagePresenter: SearchPageInteractorOutput {

    weak var output: SearchPagePresenterOutput?

    init(output: SearchPagePresenterOutput) {
        self.output = output
    }

    func presentRecentCities(areas: [Area]) {

    }

    func presentSearchResults(areas: [Area]) {
        let vms = areas.map { CitiesTableCellVM(name: $0.areaName) }
        output?.displaySearchResults(vms: vms)
    }

    func gotoWeatherDetails(for area: Area) {
        output?.gotoWeatherDetails(area: area)
    }

    func showLoading() {
        output?.showLoading()
    }

    func hideLoading() {
        output?.hideLoading()
    }

}


