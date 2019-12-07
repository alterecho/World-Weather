//
//  SearchPageProtocols.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation


protocol SearchPageInteractorInput {
    func searchFieldTextChanged(text: String)
    func searchButtonClicked()
}

protocol SearchPagePresenterInput {
    func presentRecentCities(vms: [CitiesTableCellVM])
    func presentSearchResults(vms: [CitiesTableCellVM])
}

protocol SearchPagePresenterOutput {
    func displayRecentResults(vms: [CitiesTableCellVM])
    func displaySearchResults(vms: [CitiesTableCellVM])
}

protocol SearchPageAPIWorkerProtocol {
    func fetchSearchResults(for searchString: String, completionHandler: @escaping (Response.Search?, Error?) -> Void)
    init(session: URLSession)
}

protocol SearchPageMappingWorkerProtocol {
    func areasFrom(response: Response.Search) -> [Area]
}
