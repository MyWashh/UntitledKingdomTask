class ItemsService: DownloadItemsProtocol {
    let networkManager: NetworkingManager

    init(networkManager: Net) {
        self.networkManager = networkManager
    }

    func downloadItems(completion: @escaping (Result<[ItemModel]>) -> Void) {
        request(filename: "Items.json") { dictionary in
            if let itemsDictionary = dictionary["data"] as? [[String: AnyObject]] {
                let items = self.transform(itemsDictionary: itemsDictionary)
                completion(.success(items))
            } else {
                completion(.error)
            }
        }
    }

    private func transform(itemsDictionary: [[String: AnyObject]]) -> [ItemModel] {
        var items: [ItemModel] = []
        for item in itemsDictionary {
            if let item = ItemModel(item: item) {
                items.append(item)
            }
        }
        return items
    }

    func downloadItemWithID(_ id: String, completion: @escaping (Result<ItemDetailsModel>) -> Void) {
        let filename = "Item\(id).json"
        request(filename: filename) { dictionary in
            guard let data = dictionary["data"]  as? [String: AnyObject],
                let item = ItemModel(item: data),
                let itemDetailsModel = ItemDetailsModel(item: item, details: data) else {
                    completion(.error)
                    return
            }
            completion(.success(itemDetailsModel))
        }
    }
}
