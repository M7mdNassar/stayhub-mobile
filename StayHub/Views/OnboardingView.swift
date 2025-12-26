import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Onboarding View")
                    .font(.largeTitle)
                    .padding()
                
                Text("Welcome to StayHub!")
                    .font(.title2)
                
                Spacer()
                
                Button("Get Started") {
                    hasCompletedOnboarding = true
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
    }
}
