//
//  SearchPageConfigurator.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class SearchPageConfigurator {
    func configure(viewController: SearchPageViewController) {
        let presenter = SearchPagePresenter(output: viewController)
        let interactor = SearchPageInteractor(output: presenter)

        viewController.router = SearchPagePageRouter(viewController: viewController)
        viewController.output = interactor

    }
}
