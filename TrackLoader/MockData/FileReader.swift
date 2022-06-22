import Foundation

enum FileReader {
    static func jsonData(from file: String) -> Data? {
        guard let path = Bundle.main.path(forResource: file, ofType: "json") else {
            return nil
        }

        do {
            return try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            print(error)
            return nil
        }
    }
}
