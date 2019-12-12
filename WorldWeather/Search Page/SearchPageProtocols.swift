//
//  SearchPageProtocols.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit


protocol SearchPageInteractorInput {
    func load()
    func searchFieldTextChanged(text: String)
    func searchButtonClicked()
    func selectedArea(indexPath: IndexPath)
}

protocol SearchPageInteractorOutput: PageProtocols {
    func presentRecentCities(areas: [Area])
    func presentSearchResults(areas: [Area])
    func gotoWeatherDetails(for area: Area)
}

protocol SearchPagePresenterOutput: class, PageProtocols {
    func display(vm: SearchPageViewModel)
    func gotoWeatherDetails(area: Area)
}

protocol SearchPageAPIWorkerProtocol {
    func fetchSearchResults(for searchString: String, noOfResults: Int, completionHandler: @escaping (Response.Search?, Swift.Error?) -> Void)
}

protocol SearchPageMappingWorkerProtocol {
    func areasFrom(response: Response.Search) -> [Area]
}

protocol SearchPagePageRouterProtocol {
    func gotoWeatherDetails(area: Area)
}
