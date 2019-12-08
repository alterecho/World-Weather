
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
    @IBOutlet weak var loadIndicator: LoadIndicator!

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

    override func viewDidLoad() {
        super.viewDidLoad()
        // because interactor sets the area and calls load before this view has loaded
        (area = area)
    }

    var area: Area? {
        didSet {
            if isViewLoaded {
                output?.load(area: area)
            }
        }
    }
}

extension WeatherDetailsPageViewController: WeatherDetailsPagePresenterOutput {
    func showLoading() {
        loadIndicator.isLoading = true
    }

    func hideLoading() {
        loadIndicator.isLoading = false
    }

    func display(vm: WeatherDetailsPageViewModel) {
        self.vm = vm
    }
}
