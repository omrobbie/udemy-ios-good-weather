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

    private var weatherListViewModel = WeatherListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation Controller not found!")
        }

        guard let addWeatherCityViewController = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("Add Weather City View Controller not found!")
        }

        addWeatherCityViewController.delegate = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell

        let item = weatherListViewModel.modelAt(indexPath.row)

        cell.cityNameLabel.text = item.name
        cell.temperatureLabel.text = "\(item.currentTemperature.temperature)°"

        return cell
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {

    func addWeatherDidSave(viewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherModel(viewModel)
        tableView.reloadData()
    }
}
