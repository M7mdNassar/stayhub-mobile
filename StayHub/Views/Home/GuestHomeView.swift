import SwiftUI

struct GuestHomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Guest Home View")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Search Widget Here")
                        .padding()
                    
                    Text("Featured Deals")
                        .font(.headline)
                        .padding()
                    
                    NavigationLink("Go to Guest Hotel Details", destination: GuestHotelDetailsView())
                        .padding()
                    
                    NavigationLink("Login", destination: LoginView())
                        .padding()
                    
                    NavigationLink("Sign Up", destination: SignUpView())
                        .padding()
                }
            }
            .navigationTitle("StayHub")
        }
    }
}
