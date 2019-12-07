//
//  ViewController.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 5/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class SearchPageViewController: UIViewController {

    var output: SearchPageInteractorInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        SearchPageConfigurator().configure(viewController: self)
    }
}

extension SearchPageViewController: SearchPagePresenterOutput {
    func displayRecentResults(vms: [CitiesTableCellVM]) {

    }

    func displaySearchResults(vms: [CitiesTableCellVM]) {

    }
}
