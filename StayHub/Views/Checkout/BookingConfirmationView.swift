import SwiftUI

struct BookingConfirmationView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Text("Booking Confirmed!")
                .font(.title)
                .bold()
            
            VStack(alignment: .leading, spacing: 12) {
                ConfirmationRow(title: "Confirmation Number", value: "20240715-7595")
                ConfirmationRow(title: "Booking Status", value: "Confirmed")
                ConfirmationRow(title: "Total Cost", value: "$\(Int(cartManager.totalCost))")
                ConfirmationRow(title: "Payment Method", value: "Credit Card")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            
            Spacer()
            
            NavigationLink(destination: HomeView()) {
                Text("Return to Home")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
            .simultaneousGesture(TapGesture().onEnded {
                cartManager.clearCart()
            })
        }
        .navigationBarBackButtonHidden()
    }
}

struct ConfirmationRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .bold()
        }
    }
}
