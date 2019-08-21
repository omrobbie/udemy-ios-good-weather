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
        setupViewModelBindings()
    }

    private func setupViewModelBindings() {
        var unit: String {
            get {
                switch getCurrentUnit() {
                case "imperial":
                    return "f"
                case "metric":
                    return "c"
                default:
                    return ""
                }
            }
        }

        if let viewModel = weatherViewModel {
            viewModel.name.bind { self.cityNameLabel.text = $0 }
            viewModel.currentTemperature.temperature.bind { self.currentTempLabel.text = "\($0.formatAsDegree)°\(unit)" }
            viewModel.currentTemperature.temperatureMin.bind { self.minTempLabel.text = "\($0.formatAsDegree)°\(unit)" }
            viewModel.currentTemperature.temperatureMax.bind { self.maxTempLabel.text = "\($0.formatAsDegree)°\(unit)" }
        }

        // display title after few seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.navigationItem.title = "Weather Details"
        }
    }
}
