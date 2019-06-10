import UIKit

protocol DownloadItemsProtocol {
     func downloadItems(completion: @escaping (([ItemModel]) -> Void))
     func downloadItemWithID(_ id: String, completion: @escaping ((ItemDetailsModel) -> Void))
}
