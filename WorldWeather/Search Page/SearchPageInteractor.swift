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

    private var displayedAreas: [Area] = [Area]()

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
                    self?.displayedAreas = self?.mappingWorker.areasFrom(response: searchResponse) ?? []
                    self?.output.presentSearchResults(areas: self?.displayedAreas ?? [])
                } else {
                    self?.output.presentSearchResults(areas: [])
                    //TODO: - show error
                }
            }
        } else {

        }

    }

    func selectedArea(indexPath: IndexPath) {
        let area = displayedAreas[indexPath.row]
        output.gotoWeatherDetails(for: area)
    }
}
