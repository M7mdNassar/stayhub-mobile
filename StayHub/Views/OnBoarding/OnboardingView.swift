import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var currentPage = 0
    @State private var imageOpacity: Double = 1.0
    
    // Onboarding pages data
    let pages: [(title: String, subtitle: String, imageName: String)] = [
        (
            title: "Experience Luxury",
            subtitle: "Discover thousands of hotels and resorts at the best prices, tailored just for you.",
            imageName: "onboarding_1"
        ),
        (
            title: "Book with Confidence",
            subtitle: "Secure your perfect stay with our trusted booking platform and amazing deals.",
            imageName: "onboarding_2"
        ),
        (
            title: "Travel Made Easy",
            subtitle: "Plan your dream vacation effortlessly with our seamless booking experience.",
            imageName: "onboarding_3"
        )
    ]
    
    var body: some View {
        ZStack {
            // Background Images with Fade Transition - ABSOLUTE FULL SCREEN
            ForEach(0..<pages.count, id: \.self) { index in
                Image(pages[index].imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(currentPage == index ? imageOpacity : 0)
                    .animation(.easeInOut(duration: 0.6), value: currentPage)
            }
            
            // Gradient Overlay - Full screen
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.clear,
                    Color.clear,
                    Color.black.opacity(0.3),
                    Color.black.opacity(0.6),
                    Color.black.opacity(0.8)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            // UI Layer
            VStack(spacing: 0) {
                // Skip Button - Top Right
                HStack {
                    Spacer()
                    Button(action: {
                        hasCompletedOnboarding = true
                    }) {
                        Text("Skip")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(Color.white.opacity(0.25))
                                    .background(
                                        Capsule()
                                            .fill(.ultraThinMaterial)
                                    )
                            )
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 60)
                }
                
                Spacer()
                
                // Bottom Content
                VStack(spacing: 15) {
                    Text(pages[currentPage].title)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .id("title-\(currentPage)")
                        .transition(.opacity.combined(with: .move(edge: .trailing)))
                    
                    Text(pages[currentPage].subtitle)
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.95))
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, 40)
                        .id("subtitle-\(currentPage)")
                        .transition(.opacity.combined(with: .move(edge: .trailing)))
                }
                .animation(.easeInOut(duration: 0.5), value: currentPage)
                
                // Page Indicator
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(currentPage == index ? Color.cyan : Color.white.opacity(0.4))
                            .frame(width: currentPage == index ? 28 : 8, height: 8)
                            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: currentPage)
                    }
                }
                .padding(.top, 25)
                
                // Get Started / Next Button
                Button(action: {
                    if currentPage < pages.count - 1 {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            imageOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            currentPage += 1
                            withAnimation(.easeInOut(duration: 0.3)) {
                                imageOpacity = 1.0
                            }
                        }
                    } else {
                        hasCompletedOnboarding = true
                    }
                }) {
                    HStack(spacing: 8) {
                        Text(currentPage < pages.count - 1 ? "Next" : "Get Started")
                            .font(.system(size: 18, weight: .semibold))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cyan)
                    )
                    .shadow(color: Color.cyan.opacity(0.3), radius: 12, y: 6)
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                .padding(.bottom, 50)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .gesture(
            DragGesture()
                .onEnded { value in
                    let threshold: CGFloat = 50
                    
                    if value.translation.width < -threshold && currentPage < pages.count - 1 {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            imageOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            currentPage += 1
                            withAnimation(.easeInOut(duration: 0.3)) {
                                imageOpacity = 1.0
                            }
                        }
                    } else if value.translation.width > threshold && currentPage > 0 {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            imageOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            currentPage -= 1
                            withAnimation(.easeInOut(duration: 0.3)) {
                                imageOpacity = 1.0
                            }
                        }
                    }
                }
        )
    }
}

#Preview {
    OnboardingView()
}
