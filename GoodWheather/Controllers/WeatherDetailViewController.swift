//
//  WeatherDetailViewController.swift
//  GoodWheather
//
//  Created by omrobbie on 21/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!

    var weatherViewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let weatherViewModel = weatherViewModel {
            cityNameLabel.text = weatherViewModel.name
            currentTempLabel.text = weatherViewModel.currentTemperature.temperature.formatAsDegree
            maxTempLabel.text = weatherViewModel.currentTemperature.temperatureMax.formatAsDegree
            minTempLabel.text = weatherViewModel.currentTemperature.temperatureMin.formatAsDegree
        }
    }
}
