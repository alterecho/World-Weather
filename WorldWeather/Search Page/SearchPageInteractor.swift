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

    private var searchText: String?

    init() {
        apiWorker = SearchPageAPIWorker()
        mappingWorker = SearchPageMappingWorker()
    }

    func searchFieldTextChanged(text: String) {

    }

    func searchButtonClicked() {
        if let searchText = searchText {
            apiWorker.fetchSearchResults(for: searchText) { [weak self] (searchResponse, error) in
                if let searchResponse = searchResponse {
                    self?.mappingWorker.areasFrom(response: searchResponse)
                } else {
                    // show error
                }
            }
        } else {

        }

    }


}
