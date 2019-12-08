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
        viewController?.performSegue(withIdentifier: SegueIDs.showWeatherDetails, sender: viewController)
    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIDs.showWeatherDetails {
            if let destination = segue.destination as? WeatherDetailsPageViewController {
                destination.area = area
            }
        }
    }
}
