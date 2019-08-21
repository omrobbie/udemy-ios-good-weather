//
//  WeatherListViewModel.swift
//  GoodWheather
//
//  Created by omrobbie on 20/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()

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
        case .celsius:
            weatherViewModels = weatherViewModels.map { viewModel in
                let weatherModel = viewModel
                weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value - 32) * (5/9)
                return weatherModel
            }

        case .fahrenheit:
            weatherViewModels = weatherViewModels.map { viewModel in
                let weatherModel = viewModel
                weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value * (9/5)) + 32
                return weatherModel
            }
        }
    }
}

struct WeatherViewModel: Decodable {
    let name: Dynamic<String>
    var currentTemperature: TemperatureViewModel

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    var temperature: Dynamic<Double>
    let temperatureMin: Dynamic<Double>
    let temperatureMax: Dynamic<Double>

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        temperature = Dynamic(try container.decode(Double.self, forKey: .temperature))
        temperatureMin = Dynamic(try container.decode(Double.self, forKey: .temperatureMin))
        temperatureMax = Dynamic(try container.decode(Double.self, forKey: .temperatureMax))
    }

    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}

class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener = (T) -> ()

    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    private enum CodingKeys: CodingKey {
        case value
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(value)
    }
}
