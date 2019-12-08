//
//  LoadIndicator.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class LoadIndicator: UIView {
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

    var isLoading: Bool = false {
        didSet {
            isHidden = !isLoading
            alpha = 1.0
            activityIndicator.isHidden = isHidden
            if activityIndicator.isHidden {
                activityIndicator.stopAnimating()
            } else {
                activityIndicator.startAnimating()
            }
        }
    }

//    init(view: UIView) {
//        super.init(frame: .zero)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.black.withAlphaComponent(0.375)
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
