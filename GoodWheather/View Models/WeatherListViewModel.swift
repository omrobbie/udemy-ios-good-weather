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
}

struct WeatherViewModel: Decodable {
    let name: String
    let main: TemperatureViewModel
}

struct TemperatureViewModel: Decodable {
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
}
