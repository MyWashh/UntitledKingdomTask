//
//  TableViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemsListTableViewController: UITableViewController {
    let itemsProvider: DownloadItemsProtocol
    var items: [ItemProtocol] = []

    init(itemsProvider: DownloadItemsProtocol) {
        self.itemsProvider = itemsProvider
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBars()
    }

    func setupNavigationBars() {
        title = ControllersTitles.itemsListTableViewController
        tabBarController?.title = title
        tabBarController?.navigationController?.isNavigationBarHidden = false
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemsListTableViewCell.self)
        askForItems()
    }

    func askForItems() {
        itemsProvider.downloadItems { result in
            switch result {
            case .success(let items):
                self.items = items
                self.tableView.reloadData()
            case .error:
                AlertController.showAlert(on: self, message: CommonStrings.downloadError)
            }
        }
    }
}

// MARK: TableView delegate and datasource
extension ItemsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemsListTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let itemModel = items[indexPath.row]
        cell.backgroundColor = itemModel.color
        cell.nameLabel.text = itemModel.name
        cell.previewTextLabel.text = itemModel.previewText
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ItemDetailsViewController(selectedItem: items[indexPath.row], itemsProvider: itemsProvider)
        navigationController?.isNavigationBarHidden = false
        tabBarController?.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
