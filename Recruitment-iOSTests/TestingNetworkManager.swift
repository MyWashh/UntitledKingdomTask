//
//  Recruitment_iOSTests.swift
//  Recruitment-iOSTests
//
//  Created by Marcin Michalski on 10/06/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class TestingNetworkManager: XCTestCase {
    var networkManager: NetworkingManager?
    var items: [ItemModel] = []

    override func setUp() {
        networkManager = NetworkingManager()
    }

    override func tearDown() {
        networkManager = nil
        items.removeAll()
    }

    func testExample() {
        let expectation = self.expectation(description: "Wait for items")

        networkManager?.downloadItems(completion: { items in
            self.items = items
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertGreaterThan(items.count, 0)
    }

    func testExample2() {
        XCTAssertEqual(items.count, 0)
    }
}
