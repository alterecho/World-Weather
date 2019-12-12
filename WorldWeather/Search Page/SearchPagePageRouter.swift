//
//  SearchPagePageRouter.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class SearchPagePageRouter: SearchPagePageRouterProtocol {
    private weak var viewController: SearchPageViewController?

    private var area: Area?

    init(viewController: SearchPageViewController) {
        self.viewController = viewController
    }
    
    func gotoWeatherDetails(area: Area) {
        self.area = area

        if let detailsPageViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: StoryboardIDs.weatherDetailsPage)
            as? WeatherDetailsPageViewController {
            detailsPageViewController.area = area
            viewController?.navigationController?.pushViewController(detailsPageViewController, animated: true)

        }
    }
}
