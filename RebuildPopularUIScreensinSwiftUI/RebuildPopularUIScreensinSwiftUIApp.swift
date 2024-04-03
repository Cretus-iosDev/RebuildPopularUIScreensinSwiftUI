import SwiftfulRouting
import SwiftUI

@main
struct RebuildPopularUIScreensinSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView {
                _ in
                ContentView()
            }
        }
    }
}


// MARK:  BACK SWIPE GESTURE in SwiftUI
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
