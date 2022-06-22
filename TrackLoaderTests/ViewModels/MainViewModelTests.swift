@testable import TrackLoader
import XCTest

@MainActor
class MainViewModelTests: XCTestCase {
    var viewModel: MainViewModel!

    @MainActor
    override func tearDown() {
        viewModel = nil
    }

    private func setUp(withDataSource dataSource: TrackDataSource) {
        viewModel = MainViewModel(dataSource: dataSource)
    }

    func test_initialLoadingState_isIdle() {
        setUp(withDataSource: SuccessReturningMockTracksDataSource())
        XCTAssertEqual(viewModel!.loadingState, .idle)
    }

    func test_whenDataSourceReturnsData_loadingStateIsSetToLoaded() async {
        setUp(withDataSource: SuccessReturningMockTracksDataSource())
        await viewModel!.fetchData()
        XCTAssertEqual(viewModel!.loadingState, .loaded)
    }

    func test_whenDataSourceReturnsData_loadingStateIsNotSetToError() async {
        setUp(withDataSource: SuccessReturningMockTracksDataSource())
        await viewModel!.fetchData()
        XCTAssertNotEqual(viewModel!.loadingState, .error)
    }

    func test_whenDataSourceReturnsData_tracksEqualsFour() async {
        setUp(withDataSource: SuccessReturningMockTracksDataSource())
        await viewModel!.fetchData()
        XCTAssertEqual(viewModel!.tracks.count, 4)
    }

    func test_whenDataSourceFails_tracksEqualsZero() async {
        setUp(withDataSource: ErrorReturningMockNFTsDataSource())
        await viewModel!.fetchData()
        XCTAssertEqual(viewModel!.tracks.count, 0)
    }

    func test_whenDataSourceFails_loadingStateEqualsError() async {
        setUp(withDataSource: ErrorReturningMockNFTsDataSource())
        await viewModel!.fetchData()
        XCTAssertEqual(viewModel!.loadingState, .error)
    }

    func test_whenDataSourceFails_loadingStateDoesNotEqualLoaded() async {
        setUp(withDataSource: ErrorReturningMockNFTsDataSource())
        await viewModel!.fetchData()
        XCTAssertNotEqual(viewModel!.loadingState, .loaded)
    }
}

