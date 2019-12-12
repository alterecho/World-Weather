//
//  MockViewController.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

protocol MockViewControllerDelegate {
    func performSegue(withIdentifier identifier: String, sender: Any?)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
