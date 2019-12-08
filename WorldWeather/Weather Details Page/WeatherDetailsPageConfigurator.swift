//
//  WeatherDetailsPageConfigurator.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPageConfigurator {
    func configure(viewController: WeatherDetailsPageViewController) {
        let presenter = WeatherDetailsPagePresenter(output: viewController)
        let interactor = WeatherDetailsPageInteractor(output: presenter)
        viewController.output = interactor
    }
}
