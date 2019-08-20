//
//  WeatherListViewModel.swift
//  GoodWheather
//
//  Created by omrobbie on 20/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    let name: String
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
}

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
}
