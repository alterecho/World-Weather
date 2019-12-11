
//
//  WeqtherDetailsPage.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class WeatherDetailsPageViewController: UIViewController {

    @IBOutlet weak var weatherIconImageViewYConstraint: NSLayoutConstraint!

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
                        DispatchQueue.main.async {
                            self.weatherIconImageView.image = UIImage(data: data)
                        }
                    } catch {
                        print(error)
                    }
                }
            } else {
                weatherIconImageView.image = nil
            }
            self.animate()
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetForAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.animate()
        }

    }

    var area: Area? {
        didSet {
            if isViewLoaded {
                output?.load(area: area)
            }
        }
    }

    private func resetForAnimation() {
        // set initial values for animation
        weatherIconImageViewYConstraint.constant = -weatherIconImageView.frame.height
        self.temperatureLabel.alpha = 0.0
        self.weatherDescriptionLabel.alpha = 0.0
        self.humidityLabel.alpha = 0.0

    }

    private func animate() {
        resetForAnimation()
        view.layoutIfNeeded()
        self.weatherIconImageViewYConstraint.constant = 100.0
        weatherIconImageView.needsUpdateConstraints()

        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 12.0, initialSpringVelocity: 12.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (completed) in
            UIView.animate(withDuration: 0.375, animations: {
                self.temperatureLabel.alpha = 1.0
            }) { (completed) in
                UIView.animate(withDuration: 0.75, animations: {
                    self.weatherDescriptionLabel.alpha = 1.0
                    self.humidityLabel.alpha = 1.0
                })
            }
        }


    }
}

extension WeatherDetailsPageViewController: WeatherDetailsPagePresenterOutput {
    func showAlert(title: String?, message: String) {
        AlertSystem.alert(title: title, message: message)
    }
    
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
