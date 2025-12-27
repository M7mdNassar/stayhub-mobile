import SwiftUI

struct SplashScreenView: View {
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0
    @State private var loadingProgress: CGFloat = 0
    @State private var sparkleOffset: CGFloat = -50
    
    var body: some View {
        ZStack {
                // Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.85, green: 0.95, blue: 0.98),
                        Color(red: 0.75, green: 0.90, blue: 0.95)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    // Logo Container with Sparkle Animation
                    ZStack {
                        // Sparkle Effect
                        Image(systemName: "sparkles")
                            .font(.system(size: 24))
                            .foregroundColor(.cyan.opacity(0.6))
                            .offset(x: sparkleOffset, y: -50)
                        
                        // Logo Card
                        ZStack {
                            // Shadow Layer
                            RoundedRectangle(cornerRadius: 28)
                                .fill(Color.cyan.opacity(0.1))
                                .frame(width: 130, height: 130)
                                .blur(radius: 20)
                                .offset(y: 10)
                            
                            // Main Logo Background
                            RoundedRectangle(cornerRadius: 28)
                                .fill(Color.white)
                                .frame(width: 120, height: 120)
                                .shadow(color: Color.cyan.opacity(0.2), radius: 20, x: 0, y: 10)
                            
                            // Logo Image
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                        }
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                    }
                    
                    // App Name
                    VStack(spacing: 8) {
                        HStack(spacing: 0) {
                            Text("Stay")
                                .font(.system(size: 42, weight: .bold))
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                            Text("Hub")
                                .font(.system(size: 42, weight: .bold))
                                .foregroundColor(.cyan)
                        }
                        
                        Text("FIND YOUR SANCTUARY")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(Color.gray.opacity(0.6))
                            .tracking(2)
                    }
                    .opacity(logoOpacity)
                    
                    Spacer()
                    Spacer()
                    
                    // Loading Section
                    VStack(spacing: 12) {
                        Text("Loading experience...")
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray.opacity(0.6))
                        
                        // Progress Bar
                        ZStack(alignment: .leading) {
                            // Background
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.15))
                                .frame(width: 140, height: 4)
                            
                            // Progress
                            RoundedRectangle(cornerRadius: 4)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.cyan, Color.blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: 140 * loadingProgress, height: 4)
                        }
                    }
                    .opacity(logoOpacity)
                    .padding(.bottom, 60)
                }
            }
            .onAppear {
                // Logo Animation
                withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                    logoScale = 1.0
                    logoOpacity = 1.0
                }
                
                // Sparkle Animation
                withAnimation(
                    Animation.easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: false)
                ) {
                    sparkleOffset = 50
                }
                
                // Loading Progress Animation
                withAnimation(.easeInOut(duration: 2.0)) {
                    loadingProgress = 1.0
                }
            }
        }
    }


#Preview {
    SplashScreenView()
}
