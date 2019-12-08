
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

    private var vm: WeatherDetailsPageViewModel? {
        didSet {

        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        WeatherDetailsPageConfigurator().configure(viewController: self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        WeatherDetailsPageConfigurator().configure(viewController: self)
    }

    var area: Area? {
        didSet {
            output?.load(area: area)
        }
    }
}

extension WeatherDetailsPageViewController: WeatherDetailsPagePresenterOutput {
    func display(weather: WeatherModel) {
        
    }
}
