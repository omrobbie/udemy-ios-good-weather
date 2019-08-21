//
//  SettingsViewModel.swift
//  GoodWheather
//
//  Created by omrobbie on 20/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var name: String {
        get {
            return String(describing: self)
        }
    }

    var displayName: String {
        get {
            return self.name.capitalized
        }
    }
}

func getCurrentUnit() -> String {
    let userDefaults = UserDefaults.standard

    if let value = userDefaults.value(forKey: "unit") as? String {
        return value
    }

    return ""
}

struct SettingsViewModel {

    let units = Unit.allCases

    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard

            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }

            return _selectedUnit
        }

        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }

    private var _selectedUnit: Unit = Unit.fahrenheit
}
