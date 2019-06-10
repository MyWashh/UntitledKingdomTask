//
//  TestingTableViewController.swift
//  Recruitment-iOSTests
//
//  Created by Marcin Michalski on 10/06/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class MockItemsProvider: DownloadItemsProtocol {
    var items: [ItemModel] = []
    var detailedItem: ItemDetailsModel

    init() {
        if let dictionary = JSONParser.jsonFromFilename("Test.json")?["data"] as? [[String: AnyObject]] {
            for item in dictionary {
                if let item = ItemModel(item: item) {
                    items.append(item)
                }
            }
        }
        let detailedItem = JSONParser.jsonFromFilename("Item1.json")?["data"] as? [String: AnyObject] {
        self.detailedItem = ItemDetailsModel(item: items[0], details: detailedItem)!


    }

    func downloadItems(completion: @escaping (Result<[ItemModel]>) -> Void) {
        completion(.success(items))
    }

    func downloadItemWithID(_ id: String, completion: @escaping (Result<ItemDetailsModel>) -> Void) {
      //  completion(.success(detailedItem))
    }

    
}

class TestingItemListViewController: XCTestCase {
    func testttt() {
    let itemsListTableViewController = ItemsListTableViewController(itemsProvider: MockItemsProvider())
    }
}
