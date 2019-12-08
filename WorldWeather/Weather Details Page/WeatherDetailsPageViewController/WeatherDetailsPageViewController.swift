
//
//  WeqtherDetailsPage.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class WeatherDetailsPageViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!


    var output: WeatherDetailsPageInteractorInput?
    
    private var vm: WeatherDetailsPageViewModel? {
        didSet {
            temperatureLabel.text = vm?.temperatureLabelText
            weatherDescriptionLabel.text = vm?.weatherDescriptionLabelText
            humidityLabel.text = vm?.humidityLabelText

            //TODO: implement image downloading
            if let url = vm?.weatherIcon {

                DispatchQueue.global(qos: .background).async {
                    do {
                        let data = try Data(contentsOf: url)
                        self.weatherIconImageView.image = UIImage(data: data)
                    } catch {
                        print(error)
                    }
                }
            } else {
                weatherIconImageView.image = nil
            }

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
    func display(vm: WeatherDetailsPageViewModel) {
        self.vm = vm
    }
}
