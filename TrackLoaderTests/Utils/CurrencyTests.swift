@testable import TrackLoader
import XCTest

class CurrencyTests: XCTestCase {

    func test_usdEquals_USD() {
        let currency = Currency.usd
        XCTAssertEqual(currency.rawValue, "USD")
    }

    func test_usdDoesNotEqual_GPB() {
        let currency = Currency.usd
        XCTAssertNotEqual(currency.rawValue, "GPB")
    }
}
