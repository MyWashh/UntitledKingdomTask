import XCTest
@testable import Recruitment_iOS

class TestingItemDetailsViewController: XCTestCase {
    func testDetails() {
        let itemsProvider = MockItemsProvider()
        itemsProvider.downloadItems { _ in }
        let controller = ItemDetailsViewController(selectedItem: MockItem(name: "MockName", color: .red, id: "1", previewText: "Test"), itemsProvider: itemsProvider)
        controller.loadViewIfNeeded()
        XCTAssertEqual(controller.textView.text, "Mocked detail")
    }

}
