import SwiftUI
import Combine

@MainActor
class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    
    func login(username: String, password: String) {
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            self.isAuthenticated = true
            self.currentUser = User(
                id: "1",
                username: username,
                email: "\(username)@example.com",
                token: "dummy_token_123"
            )
        }
    }
    
    func logout() {
        isAuthenticated = false
        currentUser = nil
    }
}
