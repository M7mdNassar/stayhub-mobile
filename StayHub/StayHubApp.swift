import SwiftUI

@main
struct StayHubApp: App {
    @StateObject private var themeManager = ThemeManager()
    @StateObject private var authManager = AuthManager()
    @StateObject private var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .environmentObject(authManager)
                .environmentObject(cartManager)
                .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
        }
    }
}
