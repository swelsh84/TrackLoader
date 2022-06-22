import Foundation

struct TrackResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

