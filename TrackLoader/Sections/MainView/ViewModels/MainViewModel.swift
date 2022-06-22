import Combine
import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    let dataSource: TrackDataSource

    @Published var loadingState = LoadingState.idle
    @Published var tracks: [Track] = []

    init(dataSource: TrackDataSource = SuccessReturningMockTracksDataSource()) {
        self.dataSource = dataSource
    }

    func fetchData() async {
        do {
            let response = try await dataSource.fetchData()
            process(response)
        } catch {
            handleError(error)
        }
    }

    private func handleError(_ error: Error) {
        self.loadingState = .error

        // Here I would capture the error and report it, typically to a service like Sentry.
    }

    private func process(_ response: TrackResponse) {
        self.loadingState = .loaded
        self.tracks = response.results
    }
}
