import UIKit

class TabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setViewControllers(prepareControllers(), animated: true)
    }

    func prepareControllers() -> [UIViewController]  {
        let firstNavigationController = UINavigationController(rootViewController: ItemsListTableViewController())
        let secondNavigationController = UINavigationController(rootViewController: CollectionViewController(collectionViewLayout: UICollectionViewLayout()))
        let controllers = [firstNavigationController, secondNavigationController]
        return controllers
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
