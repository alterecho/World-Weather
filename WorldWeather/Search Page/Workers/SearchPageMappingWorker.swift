//
//  SearchPageMappingWorker.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class SearchPageMappingWorker: SearchPageMappingWorkerProtocol {
    func areasFrom(response: Response.Search) -> [Area] {
        var areas = [Area]()
        response.results?.forEach({ (result) in
            let url = URL(string: result.weatherUrl?.value ?? "")
            let area = Area(areaName: result.areaName?.value ?? "",
                            country: result.country?.value ?? "",
                            region: result.region?.value ?? "",
                            latitude: Double(result.latitude ?? "") ?? 0.0,
                            longitude: Double(result.latitude ?? "") ?? 0.0,
                            weatherUrl: url)
            areas.append(area)
        })
        return areas
    }
}
