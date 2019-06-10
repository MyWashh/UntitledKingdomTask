import UIKit

protocol ItemsProtocol {
     func downloadItems(completion: @escaping (([ItemModel]) -> Void))
     func downloadItemWithID(_ id: String, completion: @escaping ((ItemDetailsModel) -> Void))
}
