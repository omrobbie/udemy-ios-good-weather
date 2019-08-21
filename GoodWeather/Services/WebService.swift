//
//  WebService.swift
//  GoodWheather
//
//  Created by omrobbie on 20/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {

    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            if let error = error {
                print("Error; \(error.localizedDescription)")
                return
            }

            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }
        }.resume()
    }
}
