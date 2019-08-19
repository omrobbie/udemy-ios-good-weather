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

    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
