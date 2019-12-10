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

protocol SearchPageInteractorOutput {
    func presentRecentCities(areas: [Area])
    func presentSearchResults(areas: [Area])
    func gotoWeatherDetails(for area: Area)
    func showLoading()
    func hideLoading()
}

protocol SearchPagePresenterOutput: class {
    func display(vm: SearchPageViewModel)
    func gotoWeatherDetails(area: Area)
    func showLoading()
    func hideLoading()
}

protocol SearchPageAPIWorkerProtocol {
    func fetchSearchResults(for searchString: String, noOfResults: Int, completionHandler: @escaping (Response.Search?, Swift.Error?) -> Void)
}

protocol SearchPageMappingWorkerProtocol {
    func areasFrom(response: Response.Search) -> [Area]
}

protocol SearchPagePageRouterProtocol {
    func gotoWeatherDetails(area: Area)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
