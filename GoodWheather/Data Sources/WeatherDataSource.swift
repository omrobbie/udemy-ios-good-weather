//
//  WeatherDataSource.swift
//  GoodWheather
//
//  Created by omrobbie on 21/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {

    let cellIdentifier: String = "WeatherCell"

    private var weatherListViewModel: WeatherListViewModel

    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(cellIdentifier) not found!")
        }

        let item = weatherListViewModel.modelAt(indexPath.row)

        cell.cityNameLabel.text = item.name.value
        cell.temperatureLabel.text = item.currentTemperature.temperature.value.formatAsDegree

        return cell
    }
}
