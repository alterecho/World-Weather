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
    func presentSearchResults()
}

protocol SearchPagePresenterOutput {
    func displaySearchResults()
}
