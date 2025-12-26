import SwiftUI
import Combine

@MainActor
class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    
    func login(username: String, password: String) {
        // Temporary simulation - replace with real API call later
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
            self.isAuthenticated = true
        }
    }
    
    func logout() {
        isAuthenticated = false
        currentUser = nil
    }
}
