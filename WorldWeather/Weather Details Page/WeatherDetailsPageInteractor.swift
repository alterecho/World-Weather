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

    init(output: WeatherDetailsPagePresenterInput) {
        self.output = output
    }

    func load(area: Area?) {
        print(area)
    }


}
