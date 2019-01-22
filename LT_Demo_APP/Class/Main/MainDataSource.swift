//
//  MainDataSource.swift
//  LT_Demo_APP
//
//  Created by Hiromu Tsuruta on 2019/01/22.
//  Copyright © 2019年 Hiromu Tsuruta. All rights reserved.
//

import UIKit

// MARK: - DataSource

final class MainDataSource: NSObject {
    var models: [MainViewModel] = []
}


// MARK: - UITableViewDataSource

extension MainDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MainTableViewCell.self, for: indexPath)
        cell.setup(by: models[indexPath.row])
        return cell
    }
}
