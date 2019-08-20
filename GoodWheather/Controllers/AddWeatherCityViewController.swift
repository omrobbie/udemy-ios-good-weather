//
//  AddWeatherCityViewController.swift
//  GoodWheather
//
//  Created by omrobbie on 19/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButton(_ sender: Any) {
        if let city = cityNameLabel.text {
            let weatherUrl = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=\(city)&appid=b6907d289e10d714a6e88b30761fae22")!
            let weatherResource = Resource<Any>(url: weatherUrl) { data in
                return data
            }

            WebService().load(resource: weatherResource) { result in
                if let result = result {
                    print(result)
                }
            }
        }
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
