//
//  ItemModel.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

struct ItemModel {
    let name: String
    let color: UIColor
    let id: String
    let previewText: String?

    init?(item: [String: AnyObject]) {
        guard let name = item["attributes"]?["name"] as? String,
            let colorString = item["attributes"]?["color"] as? String,
            let id = item["id"] as? String else { return nil }

        self.id = id
        self.name = name
        self.color = Colors(colorString).uiColor
        self.previewText = item["attributes"]?["preview"] as? String
    }
}
