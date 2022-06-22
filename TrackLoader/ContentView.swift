import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView(viewModel: MainViewModel(dataSource: SuccessReturningMockTracksDataSource()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
