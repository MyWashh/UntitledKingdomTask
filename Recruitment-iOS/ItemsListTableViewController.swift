//
//  TableViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemsListTableViewController: UITableViewController, NetworkingManagerDelegate {
    
    var itemModels: [ItemModel] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBars()
        NetworkingManager.sharedManager.delegate = self
    }

    func setupNavigationBars() {
        title = "List"
        tabBarController?.title = title
        tabBarController?.navigationController?.isNavigationBarHidden = false
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkingManager.sharedManager.downloadItems()
        tableView.register(UITableViewCell.self)
    }

    func downloadedItems(_ items: [ItemModel]) {
        self.itemModels = items
        self.tableView.reloadData()
    }
    
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        
    }
}

//MARK: TableView delegate and datasource
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
        let viewController = ItemDetailsViewController(selectedItem: itemModels[indexPath.row], index: indexPath.row)
        navigationController?.isNavigationBarHidden = false
        tabBarController?.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
