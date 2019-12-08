//
//  SearchPagePageRouter.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class SearchPagePageRouter: SearchPagePageRouterProtocol {

    private weak var viewController: SearchPageViewController?

    init(viewController: SearchPageViewController) {
        self.viewController = viewController
    }
    
    func gotoWeatherDetails(weather: WeatherDetailsPageViewModel) {
        viewController?.performSegue(withIdentifier: SegueIDs.showWeatherDetails, sender: viewController)
    }
}
