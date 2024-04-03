import SwiftUI

struct SongRowCell: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some song name goes here"
    var subtitle: String? = "some artist name"
    var onCellPress: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing:8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize,height: imageSize)
            
            VStack(alignment: .leading,spacing: 4) {
                Text(title)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundColor(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .foregroundStyle(.spotifyWhite)
        .onTapGesture {
            onCellPress?()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
