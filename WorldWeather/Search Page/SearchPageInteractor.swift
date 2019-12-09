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

    let recentAreasMax = 10

    private var displayedAreas: [Area] = [Area]()
    private var recentAreas: [Area] = [Area]()

    private var searchText: String?

    init(output: SearchPageInteractorOutput,
         apiWorker: SearchPageAPIWorkerProtocol = SearchPageAPIWorker(),
         mappingWorker: SearchPageMappingWorkerProtocol = SearchPageMappingWorker(),
        dataStore: DataStore = DataStore.shared) {
        self.apiWorker = apiWorker
        self.mappingWorker = mappingWorker
        self.output = output
    }

    func load() {
        //        searchText = "new"
        //        searchButtonClicked()
        do {
            recentAreas = try DataStore.shared.loadRecents() ?? []
        } catch {
            recentAreas = []
        }
        displayedAreas = recentAreas
        output.presentRecentCities(areas: recentAreas)
    }



    func searchFieldTextChanged(text: String) {
        searchText = text
    }

    func searchButtonClicked() {
        if let searchText = searchText {
            output.showLoading()
            apiWorker.fetchSearchResults(for: searchText, noOfResults: 10) { [weak self] (searchResponse, error) in
                if let searchResponse = searchResponse {
                    self?.displayedAreas = self?.mappingWorker.areasFrom(response: searchResponse) ?? []
                    self?.output.presentSearchResults(areas: self?.displayedAreas ?? [])
                } else {
                    self?.output.presentSearchResults(areas: [])
                    AlertSystem.alert(title: "Error", message: error?.localizedDescription)
                }
                self?.output.hideLoading()
            }
        } else {
            AlertSystem.alert(title: "", message: "Enter name of area to search")
        }
    }

    func selectedArea(indexPath: IndexPath) {
        let area = displayedAreas[indexPath.row]
        addToRecents(area: area)
        output.gotoWeatherDetails(for: area)
    }

    private func addToRecents(area: Area) {
        if recentAreas.count > (recentAreasMax - 1) {
            _ = recentAreas.popLast()
        }

        if recentAreas.count > 0 {
            recentAreas.insert(area, at: 0)
        } else {
            recentAreas.append(area)
        }
        do {
            try DataStore.shared.saveRecents(areas: recentAreas)
        } catch {
            AlertSystem.alert(title: "Error", message: "Error saving to recents")
        }

    }
}
