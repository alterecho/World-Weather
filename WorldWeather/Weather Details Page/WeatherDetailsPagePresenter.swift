//
//  WeatherDetailsPagePresenter.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPagePresenter: WeatherDetailsPagePresenterInput {
    func showLoading() {
        output?.showLoading()
    }

    func hideLoading() {
        output?.hideLoading()
    }


    weak var output: WeatherDetailsPagePresenterOutput?
    init(output: WeatherDetailsPagePresenterOutput) {
        self.output = output
    }

    func present(weather: WeatherModel) {
        let vm = WeatherDetailsPageViewModel(
            temperatureLabelText: "\(weather.temperatureInCentigrade)",
            humidityLabelText: "\(weather.humidity)",
            weatherDescriptionLabelText: weather.weatherDescription,
            weatherIcon: weather.weatherIconURL)
        output?.display(vm: vm)
    }


}
