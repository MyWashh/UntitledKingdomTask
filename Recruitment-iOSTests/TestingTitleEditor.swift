import XCTest
@testable import Recruitment_iOS

class TestingTitleEditor: XCTestCase {
    func testModifyTitle() {
        let title = TitleEditor.modifyTitle(title: "newTitle")
        XCTAssertEqual(title, "NeWtItLe")
    }
}
