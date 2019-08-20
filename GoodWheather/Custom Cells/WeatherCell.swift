//
//  WeatherCell.swift
//  GoodWheather
//
//  Created by omrobbie on 19/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    func configure(_ viewModel: WeatherViewModel) {
        cityNameLabel.text = viewModel.name
        temperatureLabel.text = "\(viewModel.currentTemperature.temperature)°"
    }
}
