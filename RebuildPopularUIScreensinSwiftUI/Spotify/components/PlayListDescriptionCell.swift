

import SwiftUI

struct PlayListDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Rutik"
    var subheadline: String = "some headline goes here"
    var onAddToPlaylistPress: (() -> Void)? = nil
    var onDownloadPress: (() -> Void)? = nil
    var onSharedPress: (() -> Void)? = nil
    var onEllipsisPress: (() -> Void)? = nil
    var onShufflePress: (() -> Void)? = nil
    var onPlayPress: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            madeForYOuSection
            
            Text(subheadline)
            
            buttonRow
            
           
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYOuSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundColor(.spotifyGreen)
            
            Text("Made for  ")
            +
            Text(userName)
                .bold()
                .foregroundStyle(.white)
        }
    }
    
    private var buttonRow: some View {
        HStack(spacing:0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
            }
            .foregroundStyle(.spotifyGreen)
        }
        .font(.title2)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        PlayListDescriptionCell()
            .padding()
    }
    
}
