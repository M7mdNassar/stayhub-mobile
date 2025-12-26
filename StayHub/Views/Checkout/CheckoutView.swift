import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var fullName = ""
    @State private var email = ""
    @State private var state = ""
    @State private var city = ""
    @State private var paymentMethod = "Credit Card"
    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvv = ""
    @State private var notes = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Selected Rooms
                if !cartManager.items.isEmpty {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Selected Rooms")
                            .font(.title2)
                            .bold()
                        
                        ForEach(Array(cartManager.items.enumerated()), id: \.element.id) { index, item in
                            CheckoutRoomCardView(item: item) {
                                cartManager.removeItem(at: index)
                            }
                        }
                    }
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "cart")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("Your cart is empty")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 60)
                }
                
                // Payment Form
                if !cartManager.items.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Payment Information")
                            .font(.title2)
                            .bold()
                        
                        VStack(spacing: 15) {
                            TextField("Full Name", text: $fullName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("Email", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                            
                            HStack {
                                TextField("State", text: $state)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("City", text: $city)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            
                            Picker("Payment Method", selection: $paymentMethod) {
                                Text("Credit Card").tag("Credit Card")
                                Text("Debit Card").tag("Debit Card")
                                Text("PayPal").tag("PayPal")
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            
                            TextField("Card Number", text: $cardNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                            
                            HStack {
                                TextField("MM/YY", text: $expirationDate)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("CVV", text: $cvv)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numberPad)
                            }
                            
                            TextEditor(text: $notes)
                                .frame(height: 80)
                                .padding(8)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .overlay(
                                    Text(notes.isEmpty ? "Notes (Optional)" : "")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 12)
                                        .padding(.top, 16)
                                        .allowsHitTesting(false),
                                    alignment: .topLeading
                                )
                        }
                        
                        // Summary
                        VStack(spacing: 10) {
                            HStack {
                                Text("Total Rooms")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("\(cartManager.itemCount)")
                                    .bold()
                            }
                            
                            HStack {
                                Text("Total Cost")
                                    .font(.headline)
                                Spacer()
                                Text("$\(Int(cartManager.totalCost))")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        
                        Button(action: {
                            navigateToConfirmation = true
                        }) {
                            Text("Book Now")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToConfirmation) {
            BookingConfirmationView()
        }
    }
}
