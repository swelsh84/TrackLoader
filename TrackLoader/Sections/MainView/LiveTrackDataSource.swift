import Foundation

class LiveTrackDataSource: TrackDataSource {
    func fetchData() async throws -> TrackResponse {

        var urlComponent = URLComponents(string: "https://itunes.apple.com/search")!
        urlComponent.queryItems = [
            URLQueryItem(name: "term", value: "rock")
        ]

        guard let url = urlComponent.url else {
            throw NetworkError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        guard let trackResponse = try? decoder.decode(TrackResponse.self, from: data) else {
            throw DataError.Decoding.couldNotDecode
        }
        return trackResponse
    }
}
