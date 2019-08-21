//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by omrobbie on 21/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTests: XCTestCase {

    private var weatherListViewModel: WeatherListViewModel!

    override func setUp() {
        super.setUp()
        weatherListViewModel = WeatherListViewModel()

        weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Houston", currentTemperature: TemperatureViewModel(temperature: 32, temperatureMin: 0, temperatureMax: 0)))

        weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Austin", currentTemperature: TemperatureViewModel(temperature: 72, temperatureMin: 0, temperatureMax: 0)))
    }
}
