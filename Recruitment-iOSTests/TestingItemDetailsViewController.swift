import XCTest
@testable import Recruitment_iOS

class TestingItemDetailsViewController: XCTestCase {
    func testDetails() {
        let itemsProvider = MockItemsProvider()
        itemsProvider.downloadItems { _ in }
        let item = MockItem(name: "MockName", color: .red, id: "1", previewText: "Test")
        let controller = ItemDetailsViewController(selectedItem: item, itemsProvider: itemsProvider)
        controller.loadViewIfNeeded()
        XCTAssertEqual(controller.textView.text, "Mocked detail")
    }

}
