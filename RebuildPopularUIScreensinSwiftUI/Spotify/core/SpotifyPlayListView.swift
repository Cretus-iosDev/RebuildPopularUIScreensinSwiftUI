import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlayListView: View {
    
    
    @Environment(\.router)  var router
    
    
    var product: Product = .mock
    var user: User = .mock
    
   
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
   
    
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical){
                LazyVStack(spacing: 12) {
                    PlayListHeaderCell(
                        height: 250,
                        title: product.title ,
                        subtitle: product.brand,
                        imageName: product.thumbnail
                    )
                    .readingFrame{
                        frame in
                        showHeader = frame.maxY < 150
                    }
                    
                    PlayListDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                    onAddToPlaylistPress: nil,
                    onDownloadPress: nil,
                    onSharedPress: nil,
                    onEllipsisPress: nil,
                    onShufflePress: nil,
                    onPlayPress: nil
                    )
                    .padding(.horizontal,16)
                    
                    ForEach(products) { product in
                            SongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPress: {
                                goToPlaylistView(product: product)
                            },
                            onEllipsisPressed: nil
                            )
                            .padding(.leading,16)
                        
                    }
                    
                }
            }
            .scrollIndicators(.hidden)
        
            header
             .frame(maxHeight: .infinity,alignment: .top)
                
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
           
            products = try await DatabaseHelper().getProducts()
          
        } catch {
            
        }
    }
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)

            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
    
    private func goToPlaylistView(product: Product) {
       
        router.showScreen(.push) {
            _ in
            SpotifyPlayListView(product: product, user: user)
        }
    }
}

#Preview {
    RouterView {
        _ in
        SpotifyPlayListView()
    }
}
