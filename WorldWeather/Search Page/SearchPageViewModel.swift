//
//  SearchPageViewModel.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 10/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

struct SearchPageViewModel {
    /// title for the page
    var title: String?
    /// placeholder for the search bar
    var searchBarPlaceholder: String?
    /// displayed in the search bar
    var searchBarText: String?
    /// title for the table
    var tableTitle: String?
    /// cells to be displayed in table
    var cells: [CitiesTableCellVM]
}
