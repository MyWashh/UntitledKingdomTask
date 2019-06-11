import UIKit

class ItemsSheetCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let itemsProvider: DownloadItemsProtocol
    var items: [ItemProtocol] = []

    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = UIScreen.main.bounds.width/2
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.scrollDirection = .vertical
        return layout
    }()

    init(itemsProvider: DownloadItemsProtocol) {
        self.itemsProvider = itemsProvider
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupNavigationBars() {
        title = ControllersTitles.itemsSheetCollectionViewController
        tabBarController?.title = title
        tabBarController?.navigationController?.isNavigationBarHidden = false
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ItemsSheetCollectionViewCell.self)
        fetchItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBars()
    }

    func fetchItems() {
        itemsProvider.downloadItems { result in
            switch result {
            case .success(let items):
                self.items = items
                self.collectionView.reloadData()
            case .error:
                AlertController.showAlert(on: self, message: CommonStrings.downloadError)
            }
        }
    }
}

// MARK: CollectionView delegate and datasource
extension ItemsSheetCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ItemsSheetCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.backgroundColor = items[indexPath.row].color
        cell.label.text = items[indexPath.row].name
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsController = ItemDetailsViewController(selectedItem: items[indexPath.row], itemsProvider: itemsProvider)
        navigationController?.isNavigationBarHidden = false
        tabBarController?.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(detailsController, animated: true)
    }
}
