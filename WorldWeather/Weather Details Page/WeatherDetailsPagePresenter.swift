//
//  WeatherDetailsPagePresenter.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPagePresenter: WeatherDetailsPagePresenterInput {

    weak var output: WeatherDetailsPagePresenterOutput?
    init(output: WeatherDetailsPagePresenterOutput) {
        self.output = output
    }

    func present(weather: WeatherModel) {

    }


}
