import UIKit

protocol ItemProtocol {
    var name: String { get }
    var color: UIColor { get }
    var id: String { get }
    var previewText: String? { get }
}

protocol ItemDetailsProtocol {
    var item: ItemModel { get }
    var desc: String { get }
}
