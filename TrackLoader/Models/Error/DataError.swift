enum DataError {
    enum Decoding: Error {
        case couldNotDecode
    }

    enum JSON: Error {
        case malformedData
    }
}
