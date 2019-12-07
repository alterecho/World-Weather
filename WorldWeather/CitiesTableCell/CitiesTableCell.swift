//
//  CitiesTableCell.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class CitiesTableCell: UITableViewCell {
    var vm: CitiesTableCellVM? {
        didSet {
            textLabel?.text = vm?.name
        }
    }
}
