import Foundation
import UIKit

final class DetailViewModel: ObservableObject {
    var track: Track
    @Published var loadingState = LoadingState.idle

    init(track: Track) {
        self.track = track
    }

    func openTrackUrl() {
        guard let url = URL(string: track.trackViewUrl) else { return }
        UIApplication.shared.open(url)
    }
}
