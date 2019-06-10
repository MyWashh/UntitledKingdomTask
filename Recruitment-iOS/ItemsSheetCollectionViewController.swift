import UIKit

class ItemsSheetCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let itemsProvider: DownloadItemsProtocol
    var items: [ItemModel] = []

    init(itemsProvider: DownloadItemsProtocol) {
        self.itemsProvider = itemsProvider
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25)
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

    override func loadView() {
        super.loadView()
        view = UIView()
        view.addSubview(collectionView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ItemsSheetCollectionViewCell.self)
        setupLayout()
        askForItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBars()
    }

    func askForItems() {
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

    func setupLayout() {
        view.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.backgroundColor = .clear
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
