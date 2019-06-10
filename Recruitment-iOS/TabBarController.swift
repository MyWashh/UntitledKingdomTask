import UIKit

class TabBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        setViewControllers(prepareControllers(), animated: true)
    }

    func prepareControllers() -> [UIViewController] {
        let networkingManager = NetworkingManager()
        let tableViewController = ItemsListTableViewController(itemsProvider: networkingManager)
        tableViewController.title = ControllersTitles.itemsListTableViewController
        let firstNavigationController = UINavigationController(rootViewController: tableViewController)

        let collectionViewController = ItemsSheetCollectionViewController(itemsProvider: networkingManager)
        collectionViewController.title = ControllersTitles.itemsSheetCollectionViewController
        let secondNavigationController = UINavigationController(rootViewController: collectionViewController)

        let controllers = [firstNavigationController, secondNavigationController]
        return controllers
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
