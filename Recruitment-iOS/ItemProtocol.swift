import UIKit

protocol ItemProtocol {
    var name: String { get }
    var color: UIColor { get }
    var id: String { get }
    var previewText: String? { get }
}

protocol ItemDetailsProtocol {
    var item: ItemProtocol { get }
    var desc: String { get }
}
