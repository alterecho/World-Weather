//
//  SearchPageProtocols.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol WeatherDetailsPageInteractorInput {
    func load(area: Area?)
}

protocol WeatherDetailsPageInteractorOutput: PageProtocols {
    func present(weather: WeatherModel?)
}

protocol WeatherDetailsPagePresenterOutput: class, PageProtocols {
    func display(vm: WeatherDetailsPageViewModel)
}

protocol WeatherDetailsPageAPIWorkerProtocol {
    func fetchWeatherDetails(location: Location, numberOfDays: Int, completionHandler: @escaping (Response.WeatherData?, Swift.Error?) -> Void)
    func downloadData(url: URL, completionHandler: @escaping (Data?, Swift.Error?) -> Void)
}

protocol WeatherDetailsPageMappingWorkerProtocol {
    func weather(from response: Response.WeatherData) -> WeatherModel?

}
