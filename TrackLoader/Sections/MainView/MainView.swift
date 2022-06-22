import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.loadingState {
                case .idle, .loading:
                    ProgressView()
                case .loaded:
                    content
                case .error:
                    Text("There has been an error")
                }
            }
            .navigationTitle("Rock Tracks")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await viewModel.fetchData()
        }
    }

    var content: some View {
        List {
            ForEach(viewModel.tracks, id: \.trackId) { track in
                Text(track.trackName)
            }
        }
        .listStyle(.plain)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(dataSource: SuccessReturningMockTracksDataSource()))
    }
}
