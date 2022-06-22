import Foundation

extension Int {
    func timeDisplay() -> String {
        let date = Date(timeIntervalSince1970: Double(self) / 1_000)

            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(identifier: "UTC")
            formatter.dateFormat = "mm:ss"
        return formatter.string(from: date)
    }
}
