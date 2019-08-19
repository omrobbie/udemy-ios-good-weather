//
//  WeatherListTableViewController.swift
//  GoodWheather
//
//  Created by omrobbie on 19/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell

        cell.cityNameLabel.text = "Houston"
        cell.temperatureLabel.text = "17°"

        return cell
    }
}
