@testable import TrackLoader
import XCTest

// Here I would also look for a greater degree of variety in the provided test data

class TrackResponseTests: XCTestCase {

    func test_createTrackResponse() {
        let trackResponse = TrackResponse(resultCount: 1, results: [Track.pumpedUpKicks])

        XCTAssertEqual(trackResponse.resultCount, 1)
        XCTAssertEqual(trackResponse.results.count, 1)
    }
}

