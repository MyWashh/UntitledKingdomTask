import XCTest
@testable import Recruitment_iOS

class TestingItemListViewController: XCTestCase {
    func testItemsListTableViewRowsNumber() {
        let itemsListTableViewController = ItemsListTableViewController(itemsProvider: MockItemsProvider())
        let rowNumbers = itemsListTableViewController.tableView(itemsListTableViewController.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowNumbers, 2)
    }

    func testItemsListTableViewCellRegistration() {
        let itemsListTableViewController = ItemsListTableViewController(itemsProvider: MockItemsProvider())
        let tableView = itemsListTableViewController.tableView
        let cell = itemsListTableViewController.tableView(tableView!, cellForRowAt: IndexPath(row: 0, section: 0)) as? ItemsListTableViewCell
        XCTAssertNotNil(cell)
    }

    func testItemsListTableViewTitles() {
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        let itemsListTableViewController = ItemsListTableViewController(itemsProvider: MockItemsProvider())
        tabBarController.setViewControllers([itemsListTableViewController], animated: false)
        itemsListTableViewController.setupNavigationBars()
        XCTAssertEqual(itemsListTableViewController.title, itemsListTableViewController.tabBarController?.title)
    }
}
