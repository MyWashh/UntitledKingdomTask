//
//  ItemDetailsModel.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

struct ItemDetailsModel {
    let item: ItemModel
    let desc: String

    init?(item: ItemModel, details: [String: AnyObject]) {
        guard let desc = details["attributes"]?["desc"] as? String else { return nil }
        self.item = item
        self.desc = desc
    }
}
