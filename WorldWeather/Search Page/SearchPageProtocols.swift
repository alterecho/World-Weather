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

protocol SearchPageInteractorOutput {
    func presentRecentCities(areas: [Area])
    func presentSearchResults(areas: [Area])
}

protocol SearchPagePresenterOutput: class {
    func displayRecentResults(vms: [CitiesTableCellVM])
    func displaySearchResults(vms: [CitiesTableCellVM])
}

protocol SearchPageAPIWorkerProtocol {
    func fetchSearchResults(for searchString: String, noOfResults: Int, completionHandler: @escaping (Response.Search?, Swift.Error?) -> Void)
    init(session: URLSession)
}

protocol SearchPageMappingWorkerProtocol {
    func areasFrom(response: Response.Search) -> [Area]
}

protocol SearchPagePageRouterProtocol {
    func gotoWeatherDetails(weather: WeatherModel)
}
