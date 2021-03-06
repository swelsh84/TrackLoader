import SwiftUI

struct TrackView: View {
    var track: Track
    var body: some View {
        HStack {
            // I would like to use a framework that provides better caching that AsyncImage does currently. Something like Kingfisher would be good.
            AsyncImage(url: URL(string: track.artworkUrl60)) { image in
                image
            } placeholder: {
                Image("Thumbnail")
                    .aspectRatio(1.0, contentMode: .fit)
            }

            VStack {
                Text(track.trackName)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(track.artistName)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(track: Track.pumpedUpKicks)
    }
}
