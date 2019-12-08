//
//  WeatherDetailsPageInteractor.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPageInteractor: WeatherDetailsPageInteractorInput {

    let output: WeatherDetailsPagePresenterInput
    private let apiWorker = WeatherDetailsPageAPIWorker()
    private let mappingWorker = WeatherDetailsPageMappingWorker()

    init(output: WeatherDetailsPagePresenterInput) {
        self.output = output
    }

    func load(area: Area?) {
        apiWorker.fetchWeatherDetails(location: Location(latitude: area?.latitude ?? 0.0, Longitude: area?.longitude ?? 0.0), numberOfDays: 2) { [weak self] (response, error) in
            if let response = response {
                if let weatherDetails = self?.mappingWorker.weather(from: response) {
                    self?.output.present(weather: weatherDetails)
                } else {
                    //TODO: handle error
                }

            } else {
                //TODO: handle error
            }
        }
    }


}
