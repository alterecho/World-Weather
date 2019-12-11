//
//  WeatherDetailsPagePresenter.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPagePresenter: WeatherDetailsPageInteractorOutput {
    func showLoading() {
        output?.showLoading()
    }

    func hideLoading() {
        output?.hideLoading()
    }

    func showAlert(title: String?, message: String) {
        output?.showAlert(title: title, message: message)
    }

    weak var output: WeatherDetailsPagePresenterOutput?
    init(output: WeatherDetailsPagePresenterOutput) {
        self.output = output
    }

    func present(weather: WeatherModel) {
        let vm = WeatherDetailsPageViewModel(
            temperatureLabelText: "\(weather.temperatureInCentigrade) °C",
            humidityLabelText: "\(weather.humidity)",
            weatherDescriptionLabelText: weather.weatherDescription,
            weatherIcon: weather.weatherIconURL)
        output?.display(vm: vm)
    }


}
