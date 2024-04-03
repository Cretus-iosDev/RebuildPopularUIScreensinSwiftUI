import SwiftfulUI
import SwiftfulRouting
import SwiftUI

struct ContentView: View {
    
    @Environment(\.router)  var router
    
    var body: some View {
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) {
                    _ in
                    SpotifyHomeView()
                }
            }
        }
        
    }
    
    
}

#Preview {
    RouterView {
        _ in
        ContentView()
    }
}
