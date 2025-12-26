import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @Published var isDarkMode = false
    
    func toggleTheme() {
        isDarkMode.toggle()
    }
}
