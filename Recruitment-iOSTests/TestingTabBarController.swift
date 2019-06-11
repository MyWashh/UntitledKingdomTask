import XCTest
@testable import Recruitment_iOS

class TestingTabBarController: XCTestCase {
    func testTabBarControllerTabsNumber() {
        let tabBarController = TabBarController()
        XCTAssertEqual(tabBarController.viewControllers?.count, 2)
    }

}
