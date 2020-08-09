import XCTest
@testable import Baskmart

final class BaskmartTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Baskmart().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
