import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var showSideMenu = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            TabView(selection: $selectedTab) {
                HomeView(showSideMenu: $showSideMenu)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(0)
                
                SearchResultsView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(1)
                
                BookingsView()
                    .tabItem {
                        Label("Bookings", systemImage: "calendar")
                    }
                    .tag(2)
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(3)
            }
            
            if showSideMenu {
                SideNavigationDrawerView(isShowing: $showSideMenu)
            }
        }
    }
}
