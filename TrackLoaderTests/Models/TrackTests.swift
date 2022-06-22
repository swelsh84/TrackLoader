@testable import TrackLoader
import XCTest

class TrackTests: XCTestCase {

    func test_createTrack() {
        let track = Track(
            wrapperType: "track",
            kind: "song",
            artistId: 414023649,
            collectionId: 435761204,
            trackId: 435761212,
            artistName: "Foster the People",
            collectionName: "Torches",
            trackName: "Pumped Up Kicks",
            collectionCensoredName: "Torches",
            artistViewUrl: "https://music.apple.com/us/artist/foster-the-people/414023649?uo=4",
            collectionViewUrl: "https://music.apple.com/us/album/pumped-up-kicks/435761204?i=435761212&uo=4",
            trackViewUrl: "https://music.apple.com/us/album/pumped-up-kicks/435761204?i=435761212&uo=4",
            previewUrl: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/dd/a9/80/dda980a0-3b62-f7b7-9588-11b929a30b3c/mzaf_4007504837203131685.plus.aac.p.m4a",
            artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ba/07/5b/ba075b3c-f0c4-b519-59f3-7ae74d43246b/dj.lajxsvkg.jpg/30x30bb.jpg",
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ba/07/5b/ba075b3c-f0c4-b519-59f3-7ae74d43246b/dj.lajxsvkg.jpg/60x60bb.jpg",
            artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ba/07/5b/ba075b3c-f0c4-b519-59f3-7ae74d43246b/dj.lajxsvkg.jpg/100x100bb.jpg",
            collectionPrice: 9.99,
            trackPrice: 1.29,
            releaseDate: Date(),
            collectionExplicitness: "notExplicit",
            trackExplicitness: "notExplicit",
            discCount: 1,
            discNumber: 1,
            trackCount: 11,
            trackNumber: 2,
            trackTimeMillis: 239840,
            country: "USA",
            currency: "USD",
            primaryGenreName: "Alternative",
            isStreamable: true
        )

        XCTAssertEqual(track.wrapperType, "track")
        XCTAssertEqual(track.artistId, 414023649)
        XCTAssertEqual(track.artistName, "Foster the People")
        XCTAssertEqual(track.collectionName, "Torches")
        XCTAssertEqual(track.trackName, "Pumped Up Kicks")
    }
}
