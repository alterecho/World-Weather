//
//  WeatherDetailsPageInteractor.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class WeatherDetailsPageInteractor: WeatherDetailsPageInteractorInput {

    let output: WeatherDetailsPageInteractorOutput
    private let apiWorker: WeatherDetailsPageAPIWorkerProtocol
    private let mappingWorker = WeatherDetailsPageMappingWorker()

    init(output: WeatherDetailsPageInteractorOutput, apiWorker: WeatherDetailsPageAPIWorkerProtocol = WeatherDetailsPageAPIWorker()) {
        self.apiWorker = apiWorker
        self.output = output
    }

    func load(area: Area?) {
        output.showLoading()
        apiWorker.fetchWeatherDetails(location: Location(latitude: area?.latitude ?? 0.0, Longitude: area?.longitude ?? 0.0), numberOfDays: 2) { [weak self] (response, error) in
            if let response = response {
                if var weatherDetails = self?.mappingWorker.weather(from: response) {
                    /* if there is a weather icon, cache the image and
                     use the URL to the temporatry local file, instead of the remote
                     */
                    if let url = weatherDetails.weatherIconURL {
                        self?.apiWorker.downloadData(url: url) { (data, error) in
                            weatherDetails.weatherIconURL = nil
                            if let data = data {
                                do {
                                    weatherDetails.weatherIconURL = try DataStore.shared.cache(data: data, filename: "tempImageData.dat")
                                } catch {
                                    // unable to cache image
                                    print(error)
                                }
                            }

                            self?.output.present(weather: weatherDetails)
                        }
                    } else {
                        self?.output.present(weather: weatherDetails)
                    }
                } else {
                    AlertSystem.alert(title: "Error", message: "Unable to map weather response")
                }

            } else {
                AlertSystem.alert(title: "Error", message: error?.localizedDescription)
            }

            self?.output.hideLoading()
        }
    }
}
