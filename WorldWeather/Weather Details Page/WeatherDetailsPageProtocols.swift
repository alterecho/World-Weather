//
//  SearchPageProtocols.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol WeatherDetailsPageInteractorInput {

}

protocol WeatherDetailsPagePresenterInput {
    func present(weather: WeatherModel)
}

protocol WeatherDetailsPagePresenterOutput: class {
    func display(weather: WeatherModel)
}
