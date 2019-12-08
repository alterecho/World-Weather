
//
//  WeqtherDetailsPage.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class WeatherDetailsPageViewController: UIViewController {
    var output: WeatherDetailsPageInteractorInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherDetailsPageConfigurator().configure(viewController: self)
    }
}

extension WeatherDetailsPageViewController: WeatherDetailsPagePresenterOutput {
    func display(weather: WeatherModel) {
        
    }
}
