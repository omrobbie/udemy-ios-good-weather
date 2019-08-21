//
//  TableViewDataSource.swift
//  GoodWheather
//
//  Created by omrobbie on 21/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {

    let cellIdentifier: String
    let configureCell: (CellType, ViewModel) -> ()

    var items: [ViewModel]

    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else {
            fatalError("\(cellIdentifier) not found!")
        }

        let item = items[indexPath.row]

        configureCell(cell, item)

        return cell
    }
}
