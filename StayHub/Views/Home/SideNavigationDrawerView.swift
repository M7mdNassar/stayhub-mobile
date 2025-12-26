import SwiftUI

struct SideNavigationDrawerView: View {
    @Binding var isShowing: Bool
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    isShowing = false
                }
            
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Side Navigation Drawer")
                        .font(.title2)
                        .padding()
                    
                    Button("Featured Deals") {
                        isShowing = false
                    }
                    .padding()
                    
                    Button("Trending Destinations") {
                        isShowing = false
                    }
                    .padding()
                    
                    Button("Recently Visited") {
                        isShowing = false
                    }
                    .padding()
                    
                    Button("Shopping Cart") {
                        isShowing = false
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("Logout") {
                        authManager.logout()
                        isShowing = false
                    }
                    .padding()
                }
                .frame(width: 280)
                .background(Color(.systemBackground))
                
                Spacer()
            }
        }
    }
}
