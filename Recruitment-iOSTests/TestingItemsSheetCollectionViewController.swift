import XCTest
@testable import Recruitment_iOS

class TestingItemsSheetCollectionViewController: XCTestCase {
    func testItemsSheetCollectionViewRowsNumber() {
        let collectionViewController = ItemsSheetCollectionViewController(itemsProvider: MockItemsProvider())
        let rowNumbers = collectionViewController.collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(rowNumbers, 2)
    }

    func testItemsListTableViewCell() {
        let itemsSheetCollectionViewController = ItemsSheetCollectionViewController(itemsProvider: MockItemsProvider())
        let collectionView = itemsSheetCollectionViewController.collectionView
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = itemsSheetCollectionViewController.collectionView(collectionView!, cellForItemAt: indexPath)
        XCTAssertNotNil(cell)
    }

    func testItemsListTableViewTitles() {
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        let collectionViewController = ItemsSheetCollectionViewController(itemsProvider: MockItemsProvider())
        tabBarController.setViewControllers([collectionViewController], animated: false)
        collectionViewController.setupNavigationBars()
        XCTAssertEqual(collectionViewController.title, collectionViewController.tabBarController?.title)
    }

}
