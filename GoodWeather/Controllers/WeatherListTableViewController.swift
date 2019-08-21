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
    private var datasource: TableViewDataSource<WeatherCell, WeatherViewModel>!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        datasource = TableViewDataSource(cellIdentifier: "WeatherCell", items: weatherListViewModel.weatherViewModels, configureCell: { (cell, viewModel) in
            cell.cityNameLabel.text = "\(viewModel.name.value)"
            cell.temperatureLabel.text = "\(viewModel.currentTemperature.temperature.value.formatAsDegree)°"
        })
        tableView.dataSource = datasource
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddWeatherCityViewController":
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("Navigation Controller not found!")
            }

            guard let addWeatherCityViewController = nav.viewControllers.first as? AddWeatherCityViewController else {
                fatalError("Add Weather City View Controller not found!")
            }

            addWeatherCityViewController.delegate = self

        case "SettingsTableViewController":
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("Navigation Controller not found!")
            }

            guard let settingsTableViewController = nav.viewControllers.first as? SettingsTableViewController else {
                fatalError("Settings Table View Controller not found!")
            }

            settingsTableViewController.delegate = self

        case "WeatherDetailViewController":
            guard let weatherDetailViewController = segue.destination as? WeatherDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                return
            }

            let weatherViewModel = weatherListViewModel.modelAt(indexPath.row)

            weatherDetailViewController.weatherViewModel = weatherViewModel

        default:
            break
        }
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

        cell.configure(item)

        return cell
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {

    func addWeatherDidSave(viewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(viewModel)
        datasource.updateItems(weatherListViewModel.weatherViewModels)
        tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {

    func settingsDone(viewModel: SettingsViewModel) {
        weatherListViewModel.updateUnit(to: viewModel.selectedUnit)
        tableView.reloadData()
    }
}
