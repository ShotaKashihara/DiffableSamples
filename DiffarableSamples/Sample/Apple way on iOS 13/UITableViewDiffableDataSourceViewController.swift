//
//  UITableViewDiffableDataSourceViewController.swift
//  DiffarableSamples
//
//  Created by wantedly on 2020/03/05.
//  Copyright © 2020 com.wantedly. All rights reserved.
//

import UIKit

final class UITableViewDiffableDataSourceViewController: T2ableViewController {

    var dataSource: UITableViewDiffableDataSource<String, String>! = nil

    override func viewDidLoad() {
        setupTableView()
        self.dataSource = makeDataSource()
        self.dataSource.defaultRowAnimation = .fade
        self.dataSource.apply(Apple.sourceSnapShot)

        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] timer in
            self?.dataSource.apply(Apple.targetSnapShot)
        }
    }

    private func makeDataSource() -> UITableViewDiffableDataSource<String, String> {
        return UITableViewDiffableDataSource<String, String>(tableView: tableView) {
                (tableView: UITableView, indexPath: IndexPath, item: String) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
            cell.textLabel?.text = item
            return cell
        }
    }
}
