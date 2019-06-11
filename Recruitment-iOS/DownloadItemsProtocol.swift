import UIKit

protocol DownloadItemsProtocol {
     func downloadItems(completion: @escaping (Result<[ItemProtocol]>) -> Void)
     func downloadItemWithID(_ id: String, completion: @escaping (Result<ItemDetailsProtocol>) -> Void)
}
