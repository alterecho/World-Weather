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
    private var vm: SearchPageViewModel

    init(output: SearchPagePresenterOutput) {
        self.output = output
        vm = SearchPageViewModel(title: "Search", searchBarPlaceholder: "Enter area to search", searchBarText: nil, tableTitle: "Recent", cells: [])
    }

    func presentRecentCities(areas: [Area]) {
        vm.tableTitle = "Recently viewed"
        vm.cells = areas.map { CitiesTableCellVM(name: $0.areaName) }
        output?.display(vm: vm)
    }

    func presentSearchResults(areas: [Area]) {
        vm.tableTitle = "Results"
        vm.cells = areas.map { CitiesTableCellVM(name: $0.areaName) }
        output?.display(vm: vm)
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

    func showAlert(title: String?, message: String) {
        output?.showAlert(title: title, message: message)
    }


}


