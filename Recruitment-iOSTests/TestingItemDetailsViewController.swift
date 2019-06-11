//
//  TestingItemDetailsViewController.swift
//  Recruitment-iOSTests
//
//  Created by Marcin Michalski on 10/06/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class TestingItemDetailsViewController: XCTestCase {
    func testDetails() {
        let itemsProvider = MockItemsProvider()
        itemsProvider.downloadItems { _ in }
        let controller = ItemDetailsViewController(selectedItem: MockItem(name: "mockName", color: .red, id: "1", previewText: "test"), itemsProvider: itemsProvider)
        controller.loadViewIfNeeded()
        XCTAssertEqual(controller.textView.text, "Mocked detail")
    }

}
