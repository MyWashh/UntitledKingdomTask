//
//  NetworkingManager.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit
class NetworkingManager: NSObject, DownloadItemsProtocol {
     func downloadItems(completion: @escaping (Result<[ItemProtocol]>) -> Void) {
        request(filename: "Items.json") { dictionary in
            if let itemsDictionary = dictionary["data"] as? [[String: AnyObject]] {
                let items = self.transform(itemsDictionary: itemsDictionary)
                completion(.success(items))
            } else {
                completion(.error)
            }
        }
    }

    private func transform(itemsDictionary: [[String: AnyObject]]) -> [ItemProtocol] {
        var items: [ItemModel] = []
        for item in itemsDictionary {
            if let item = ItemModel(item: item) {
                items.append(item)
            }
        }
        return items
    }

     func downloadItemWithID(_ id: String, completion: @escaping (Result<ItemDetailsProtocol>) -> Void) {
        let filename = "Item\(id).json"
        request(filename: filename) { dictionary in
            guard let data = dictionary["data"]  as? [String: AnyObject],
                let item = ItemModel(item: data),
                let itemDetailsModel = ItemDetailsModel(item: item, details: data) else {
                    completion(.error)
                    return
            }
            completion(.success(itemDetailsModel))
        }
    }

    private func request(filename: String, completionBlock: @escaping ([String: AnyObject]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            if let dictionary = JSONParser.jsonFromFilename(filename) {
                completionBlock(dictionary)
            } else {
                completionBlock([:])
            }
        }
    }
}
