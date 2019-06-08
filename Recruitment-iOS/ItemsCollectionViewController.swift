import UIKit

class CollectionViewController: UICollectionViewController {
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        title = "Collection List"
        let item = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBack))
        navigationItem.leftBarButtonItem = item
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let item = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBack))
        navigationItem.leftBarButtonItem = item
    }

    @objc func didTapBack() {
        tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
}
