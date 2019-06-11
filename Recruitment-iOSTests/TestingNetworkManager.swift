import XCTest
@testable import Recruitment_iOS

class TestingNetworkManager: XCTestCase {
    var networkManager: NetworkingManager?
    var items: [ItemProtocol] = []

    override func setUp() {
        networkManager = NetworkingManager()
    }

    override func tearDown() {
        networkManager = nil
        items.removeAll()
    }

    func testItemsDownload() {
        let expectation = self.expectation(description: "Wait for items")

        networkManager?.downloadItems(completion: { result in
            expectation.fulfill()
            switch result {
            case .success(let items):
                self.items = items
                XCTAssertGreaterThan(self.items.count, 0)
            case .error:
                XCTAssertEqual(self.items.count, 0)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testItemDownload() {
        let expectation = self.expectation(description: "Wait for result")

        networkManager?.downloadItemWithID("2", completion: { result in
            expectation.fulfill()
            switch result {
            case .success(let item):
                XCTAssertEqual(item.item.color, .red)
            case .error:
                XCTFail()
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testItemDownloadFailure() {
        let expectation = self.expectation(description: "Wait for result")

        networkManager?.downloadItemWithID("id", completion: { result in
            expectation.fulfill()
            switch result {
            case .success(_):
                XCTFail()
            case .error:
                XCTAssertTrue(true)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
}
