import Foundation

// Required for the presentation of Currency text within SwiftUI Text

class CurrencyFormatter {
    static func formatCurrency(currency: Currency, price: Double) -> String {
        return price.formatted(.currency(code: currency.rawValue).presentation(.narrow))
    }
}

