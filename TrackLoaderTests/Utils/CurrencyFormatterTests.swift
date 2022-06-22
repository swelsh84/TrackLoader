@testable import TrackLoader
import XCTest

class CurrencyFormatterTests: XCTestCase {

    func test_nineDollarsNinetyNineCents_createsCorrectString() {
        let currency = 9.99
        let convertedCurrency = CurrencyFormatter.formatCurrency(currency: .usd, price: currency)

        XCTAssertEqual(convertedCurrency, "$9.99")
    }

    func test_threeDollarsFortyFiveCents_createsCorrectString() {
        let currency = 3.45
        let convertedCurrency = CurrencyFormatter.formatCurrency(currency: .usd, price: currency)

        XCTAssertEqual(convertedCurrency, "$3.45")
    }

    func test_tenDollars_createsCorrectString() {
        let currency = 10.0
        let convertedCurrency = CurrencyFormatter.formatCurrency(currency: .usd, price: currency)

        XCTAssertEqual(convertedCurrency, "$10.00")
    }

    func test_tenDollars_doesNotCreatesIncorrectString() {
        let currency = 10.0
        let convertedCurrency = CurrencyFormatter.formatCurrency(currency: .usd, price: currency)

        XCTAssertNotEqual(convertedCurrency, "$10.000")
    }

    func test_threeDollarsFortyFiveCents_doesNotCreateIncorrectString() {
        let currency = 3.45
        let convertedCurrency = CurrencyFormatter.formatCurrency(currency: .usd, price: currency)

        XCTAssertNotEqual(convertedCurrency, "$3.450")
    }
}
