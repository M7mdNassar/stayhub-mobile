import SwiftUI

struct SideNavigationDrawerView: View {
    @Binding var isShowing: Bool
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                // Profile Section
                HStack(spacing: 15) {
                    Circle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Text(authManager.currentUser?.username.prefix(1).uppercased() ?? "U")
                                .font(.title)
                                .foregroundColor(.blue)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(authManager.currentUser?.username ?? "User")
                            .font(.headline)
                        Text(authManager.currentUser?.email ?? "user@email.com")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .padding(.top, 40)
                
                Divider()
                
                // Menu Items
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        MenuItemView(icon: "star.fill", title: "Featured Deals") {
                            isShowing = false
                        }
                        
                        MenuItemView(icon: "flame.fill", title: "Trending Destinations") {
                            isShowing = false
                        }
                        
                        MenuItemView(icon: "clock.fill", title: "Recently Visited Hotels") {
                            isShowing = false
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        Button(action: {
                            themeManager.toggleTheme()
                        }) {
                            HStack {
                                Image(systemName: themeManager.isDarkMode ? "sun.max.fill" : "moon.fill")
                                    .frame(width: 24)
                                Text("Theme")
                                Spacer()
                                Text(themeManager.isDarkMode ? "Dark" : "Light")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                        .foregroundColor(.primary)
                        
                        NavigationLink(destination: CheckoutView()) {
                            HStack {
                                Image(systemName: "cart.fill")
                                    .frame(width: 24)
                                Text("Shopping Cart")
                                Spacer()
                                if cartManager.itemCount > 0 {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 24, height: 24)
                                        .overlay(
                                            Text("\(cartManager.itemCount)")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        )
                                }
                            }
                            .padding()
                            .foregroundColor(.primary)
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        Button(action: {
                            authManager.logout()
                            isShowing = false
                        }) {
                            HStack {
                                Image(systemName: "arrow.right.square")
                                    .frame(width: 24)
                                Text("Logout")
                            }
                            .padding()
                            .foregroundColor(.red)
                        }
                    }
                }
                
                Spacer()
            }
            .frame(width: 280)
            .background(Color(.systemBackground))
            
            Spacer()
        }
    }
}


struct MenuItemView: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 24)
                Text(title)
                Spacer()
            }
            .padding()
            .foregroundColor(.primary)
        }
    }
}
