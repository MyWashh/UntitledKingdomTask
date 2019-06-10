import XCTest
@testable import Recruitment_iOS

class TestingTabBarController: XCTestCase {

    func testTabBarController() {
        let tabBarController = TabBarController()
        XCTAssertEqual(tabBarController.viewControllers?.count, 2)
    }

}
