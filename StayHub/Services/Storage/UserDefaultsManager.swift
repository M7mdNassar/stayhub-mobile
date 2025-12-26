import Foundation
import Security

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private init() {}
    
    private let defaults = UserDefaults.standard
    
    // Keys
    private let hasCompletedOnboardingKey = "hasCompletedOnboarding"
    private let isDarkModeKey = "isDarkMode"
    private let recentSearchesKey = "recentSearches"
    private let recentlyViewedHotelsKey = "recentlyViewedHotels"
    
    // Onboarding
    var hasCompletedOnboarding: Bool {
        get { defaults.bool(forKey: hasCompletedOnboardingKey) }
        set { defaults.set(newValue, forKey: hasCompletedOnboardingKey) }
    }
    
    // Theme
    var isDarkMode: Bool {
        get { defaults.bool(forKey: isDarkModeKey) }
        set { defaults.set(newValue, forKey: isDarkModeKey) }
    }
    
    // Recent Searches
    func saveRecentSearch(_ params: SearchParams) {
        var searches = getRecentSearches()
        searches.insert(params, at: 0)
        
        // Keep only last 10 searches
        if searches.count > 10 {
            searches = Array(searches.prefix(10))
        }
        
        if let encoded = try? JSONEncoder().encode(searches) {
            defaults.set(encoded, forKey: recentSearchesKey)
        }
    }
    
    func getRecentSearches() -> [SearchParams] {
        guard let data = defaults.data(forKey: recentSearchesKey),
              let searches = try? JSONDecoder().decode([SearchParams].self, from: data) else {
            return []
        }
        return searches
    }
    
    func clearRecentSearches() {
        defaults.removeObject(forKey: recentSearchesKey)
    }
    
    // Recently Viewed Hotels
    func saveRecentlyViewedHotel(_ hotelId: String) {
        var hotels = getRecentlyViewedHotels()
        
        // Remove if already exists
        hotels.removeAll { $0 == hotelId }
        
        // Add to beginning
        hotels.insert(hotelId, at: 0)
        
        // Keep only last 20
        if hotels.count > 20 {
            hotels = Array(hotels.prefix(20))
        }
        
        defaults.set(hotels, forKey: recentlyViewedHotelsKey)
    }
    
    func getRecentlyViewedHotels() -> [String] {
        return defaults.stringArray(forKey: recentlyViewedHotelsKey) ?? []
    }
    
    func clearRecentlyViewedHotels() {
        defaults.removeObject(forKey: recentlyViewedHotelsKey)
    }
}
