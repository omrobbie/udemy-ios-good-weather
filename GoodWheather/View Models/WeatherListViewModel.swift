//
//  WeatherListViewModel.swift
//  GoodWheather
//
//  Created by omrobbie on 20/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()

    mutating func addWeatherModel(_ viewModel: WeatherViewModel) {
        weatherViewModels.append(viewModel)
    }

    func numberOfRows() -> Int {
        return weatherViewModels.count
    }

    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }

    mutating func updateUnit(to unit: Unit) {
        switch unit {
        case .celcius:
            weatherViewModels = weatherViewModels.map { viewModel in
                var weatherModel = viewModel
                weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * (5/9)
                return weatherModel
            }

        case .fahrenheit:
            weatherViewModels = weatherViewModels.map { viewModel in
                var weatherModel = viewModel
                weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * (9/5)) + 32
                return weatherModel
            }
        }
    }
}

struct WeatherViewModel: Decodable {
    let name: String
    var currentTemperature: TemperatureViewModel

    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    var temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double

    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
