import Foundation

class SuccessReturningMockTracksDataSource: TrackDataSource {
    func fetchData() async throws -> TrackResponse {
        guard let data = FileReader.jsonData(from: "tracks") else {
            throw DataError.JSON.malformedData
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try decoder.decode(TrackResponse.self, from: data)
    }
}

class ErrorReturningMockNFTsDataSource: TrackDataSource {
    func fetchData() async throws -> TrackResponse {
        throw NetworkError.somethingWentWrong
    }
}
