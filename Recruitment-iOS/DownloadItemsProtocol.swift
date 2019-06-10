import UIKit

protocol DownloadItemsProtocol {
     func downloadItems(completion: @escaping (Result<[ItemModel]>) -> Void)
     func downloadItemWithID(_ id: String, completion: @escaping (Result<ItemDetailsModel>) -> Void)
}
