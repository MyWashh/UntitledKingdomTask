//
//  TableViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemsListTableViewController: UITableViewController {

    var itemModels: [ItemModel] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBars()
    }

    func setupNavigationBars() {
        title = ControllersTitles.ItemsListTableViewController
        tabBarController?.title = title
        tabBarController?.navigationController?.isNavigationBarHidden = false
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkingManager.sharedManager.downloadItems { items in
            self.itemModels = items
            self.tableView.reloadData()
        }
        tableView.register(UITableViewCell.self)
    }
}

// MARK: TableView delegate and datasource
extension ItemsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let itemModel = itemModels[indexPath.row]
        cell.backgroundColor = itemModel.color
        cell.textLabel?.text = itemModel.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ItemDetailsViewController(selectedItem: itemModels[indexPath.row])
        navigationController?.isNavigationBarHidden = false
        tabBarController?.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
