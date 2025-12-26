import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var themeManager: ThemeManager
    @State private var showingLogoutAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                // User Info Section
                Section {
                    HStack(spacing: 15) {
                        Circle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 70, height: 70)
                            .overlay(
                                Text(authManager.currentUser?.username.prefix(1).uppercased() ?? "U")
                                    .font(.title)
                                    .foregroundColor(.blue)
                            )
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(authManager.currentUser?.username ?? "User")
                                .font(.title3)
                                .bold()
                            Text(authManager.currentUser?.email ?? "user@email.com")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 10)
                }
                
                // Account Settings
                Section("Account Settings") {
                    NavigationLink(destination: Text("Edit Profile")) {
                        Label("Edit Profile", systemImage: "person.circle")
                    }
                    
                    NavigationLink(destination: Text("Change Password")) {
                        Label("Change Password", systemImage: "lock.circle")
                    }
                    
                    NavigationLink(destination: Text("Notifications")) {
                        Label("Notifications", systemImage: "bell.circle")
                    }
                }
                
                // App Preferences
                Section("Preferences") {
                    HStack {
                        Label("Dark Mode", systemImage: "moon.circle")
                        Spacer()
                        Toggle("", isOn: $themeManager.isDarkMode)
                    }
                    
                    NavigationLink(destination: Text("Language")) {
                        Label("Language", systemImage: "globe")
                    }
                }
                
                // About
                Section("About") {
                    NavigationLink(destination: Text("Help & Support")) {
                        Label("Help & Support", systemImage: "questionmark.circle")
                    }
                    
                    NavigationLink(destination: Text("Privacy Policy")) {
                        Label("Privacy Policy", systemImage: "hand.raised.circle")
                    }
                    
                    NavigationLink(destination: Text("Terms of Service")) {
                        Label("Terms of Service", systemImage: "doc.text.circle")
                    }
                    
                    HStack {
                        Label("Version", systemImage: "info.circle")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
                
                // Logout
                Section {
                    Button(action: {
                        showingLogoutAlert = true
                    }) {
                        HStack {
                            Spacer()
                            Label("Logout", systemImage: "arrow.right.square")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .alert("Logout", isPresented: $showingLogoutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Logout", role: .destructive) {
                    authManager.logout()
                }
            } message: {
                Text("Are you sure you want to logout?")
            }
        }
    }
}
