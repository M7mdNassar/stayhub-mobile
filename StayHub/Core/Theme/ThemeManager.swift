import SwiftUI
import Combine

@MainActor
class ThemeManager: ObservableObject {
    @Published var isDarkMode = false
    
    func toggleTheme() {
        isDarkMode.toggle()
    }
}
