//
//  SearchPageInteractor.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation


class SearchPageInteractor: SearchPageInteractorInput {

    let apiWorker: SearchPageAPIWorkerProtocol
    let mappingWorker: SearchPageMappingWorkerProtocol
    let output: SearchPageInteractorOutput

    private var searchText: String?

    init(output: SearchPageInteractorOutput) {
        apiWorker = SearchPageAPIWorker()
        mappingWorker = SearchPageMappingWorker()
        self.output = output

        searchText = "new"
        searchButtonClicked()
    }

    func searchFieldTextChanged(text: String) {
        searchText = text
    }

    func searchButtonClicked() {
        if let searchText = searchText {
            apiWorker.fetchSearchResults(for: searchText, noOfResults: 10) { [weak self] (searchResponse, error) in
                if let searchResponse = searchResponse {
                    let areas = self?.mappingWorker.areasFrom(response: searchResponse)
                    self?.output.presentSearchResults(areas: areas ?? [])
                } else {
                    self?.output.presentSearchResults(areas: [])
                    //TODO: - show error
                }
            }
        } else {

        }

    }

    func selectedArea(indexPath: IndexPath) {
        let weatherModel = WeatherModel(temperatureInCentigrade: 0, temperatureInFahrenheit: 0,
                                        humidity: 0, weatherDescription: nil,
                                        weatherIconURL: nil)
        output.gotoWeatherDetails(weather: weatherModel)
    }
}
