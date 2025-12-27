import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            // Main App Content
            Group {
                if !hasCompletedOnboarding {
                    OnboardingView()
                } else if authManager.isAuthenticated {
                    MainTabView()
                } else {
                    LoginSignupPromptView()
                }
            }
            .opacity(showSplash ? 0 : 1)
            
            // Splash Screen Overlay
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
        .onAppear {
            // Hide splash after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
        .environmentObject(AuthManager())
        .environmentObject(CartManager())
}
