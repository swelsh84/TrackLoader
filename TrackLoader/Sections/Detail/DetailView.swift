import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel

    var body: some View {
        VStack {
            // Similar to in TrackView, I'd like some caching options here.
            AsyncImage(url: URL(string: viewModel.track.artworkUrl60)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image("Thumbnail")
                    .aspectRatio(1.0, contentMode: .fit)
            }

            Spacer()

            VStack {
                Text(viewModel.track.trackName)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(viewModel.track.artistName)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("\(CurrencyFormatter.formatCurrency(currency: viewModel.track.currency, price: viewModel.track.trackPrice))")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()

            Spacer()

            VStack {
                Text("\(viewModel.track.trackTimeMillis.timeDisplay())")
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("\(viewModel.track.releaseDate.formatDate())")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()

            Spacer()

            Button {
                viewModel.openTrackUrl()
            } label: {
                Text("More info")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue, lineWidth: 2)
            )
            .padding(.horizontal)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var viewModel = DetailViewModel(track: Track.pumpedUpKicks)
    static var previews: some View {
        DetailView(viewModel: viewModel)
    }
}
