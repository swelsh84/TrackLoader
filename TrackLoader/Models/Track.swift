import Foundation

struct Track: Decodable {
    var wrapperType: String
    var kind: String
    var artistId: Int
    var collectionId: Int
    var trackId: Int
    var artistName: String
    var collectionName: String
    var trackName: String
    var collectionCensoredName: String
    var artistViewUrl: String
    var collectionViewUrl: String
    var trackViewUrl: String
    var previewUrl: String
    var artworkUrl30: String
    var artworkUrl60: String
    var artworkUrl100: String
    var collectionPrice: Double
    var trackPrice: Double
    var releaseDate: Date
    var collectionExplicitness: String
    var trackExplicitness: String
    var discCount: Int
    var discNumber: Int
    var trackCount: Int
    var trackNumber: Int
    var trackTimeMillis: Int
    var country: String
    var currency: Currency
    var primaryGenreName: String
    var isStreamable: Bool
}
