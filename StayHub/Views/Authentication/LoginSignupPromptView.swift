
import SwiftUI

struct LoginSignupPromptView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 1. Full Screen Background
                Image("WelcomeScreenBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .ignoresSafeArea()
                
                // 2. Enhanced Gradient Overlay (Darker at top and bottom for legibility)
                LinearGradient(
                    gradient: Gradient(colors: [
                        .black.opacity(0.6), // Darker top for logo
                        .clear,
                        .black.opacity(0.7)  // Darker bottom for buttons/footer
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // 3. Content Layer
                VStack(spacing: 0) {
                    // Header Logo Area - Added Padding for Safe Area
                    HStack(spacing: 8) {
                        Image(systemName: "globe.americas.fill")
                            .font(.system(size: 22))
                        Text("StayHub")
                            .font(.system(size: 18, weight: .bold))
                            .tracking(2)
                    }
                    .foregroundColor(.white)
                    .padding(.top, 90) // Moved down to clear the Dynamic Island
                    
                    Spacer()
                    
                    // Main Titles
                    VStack(spacing: 12) {
                        Text("Find Your\nPerfect Escape")
                            .font(.system(size: 40, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Sign in to unlock exclusive member deals and manage your dream vacations.")
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .opacity(0.9)
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Action Buttons
                    VStack(spacing: 16) {
                        NavigationLink(destination: SignUpView()) {
                            Text("Create an Account")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .background(Color.cyan)
                                .cornerRadius(12)
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Log In")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                        }
                        
                        NavigationLink(destination: GuestHomeView()) {
                            HStack(spacing: 4) {
                                Text("Skip and browse as Guest")
                                Image(systemName: "arrow.right")
                            }
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.top, 8)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                    
                    // Footer: Social Proof - Added Bottom Padding
                    HStack(spacing: -10) {
                        AvatarView(imageName: "avatar1")
                        AvatarView(imageName: "avatar2")
                        AvatarView(imageName: "avatar3")
                        
                        Text("Trusted by 10k+ travelers")
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 70) // Increased to clear the home indicator bar
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct AvatarView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 32, height: 32)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

#Preview("1. Login/Signup Prompt") {
    LoginSignupPromptView()
}
