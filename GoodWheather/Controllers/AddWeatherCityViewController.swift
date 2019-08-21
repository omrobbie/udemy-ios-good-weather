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

    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind { self.addCityViewModel.city = $0 }
        }
    }

    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind { self.addCityViewModel.state = $0 }
        }
    }

    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }

    private var addCityViewModel = AddCityViewModel()
    
    var delegate: AddWeatherDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButton(_ sender: Any) {
        if let city = cityNameTextField.text {
            if let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c2818357c736d789a6086696fc8d9b30&units=\(getCurrentUnit())") {
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
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
