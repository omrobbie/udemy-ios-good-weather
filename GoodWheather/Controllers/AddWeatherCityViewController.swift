//
//  AddWeatherCityViewController.swift
//  GoodWheather
//
//  Created by omrobbie on 19/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UITextField!

    var delegate: AddWeatherDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButton(_ sender: Any) {
        if let city = cityNameLabel.text {
            let weatherUrl = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=\(city)&appid=b6907d289e10d714a6e88b30761fae22")!
            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl) { data in
                let weatherViewModel = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherViewModel
            }

            WebService().load(resource: weatherResource) { [weak self] result in
                if let weatherViewModel = result {
                    print(weatherViewModel)

                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(viewModel: weatherViewModel)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
