@testable import Recruitment_iOS
import UIKit

struct MockItem: ItemProtocol {
    var name: String
    var color: UIColor
    var id: String
    var previewText: String?
}

struct MockItemDetail: ItemDetailsProtocol {
    var item: ItemProtocol
    var desc: String
}

class MockItemsProvider: DownloadItemsProtocol {
    var mockItems: [ItemProtocol] = []

    func downloadItems(completion: @escaping (Result<[ItemProtocol]>) -> Void) {
        let firstItem = MockItem(name: "TestName", color: .red, id: "1", previewText: "Preview")
        let secondItem = MockItem(name: "TestName2", color: .blue, id: "2", previewText: "Second preview")
        mockItems = [firstItem, secondItem]
        completion(.success(mockItems))
    }

    func downloadItemWithID(_ id: String, completion: @escaping (Result<ItemDetailsProtocol>) -> Void) {
        let mockDetailsItem = MockItemDetail(item: mockItems[0], desc: "Mocked detail")
        completion(.success(mockDetailsItem))
    }
}
