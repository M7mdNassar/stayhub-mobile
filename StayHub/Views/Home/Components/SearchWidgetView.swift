import SwiftUI

struct SearchWidgetView: View {
    @Binding var searchParams: SearchParams
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Where are you going?", text: $searchParams.destination)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                DatePicker("Check-in", selection: $searchParams.checkIn, displayedComponents: .date)
                    .labelsHidden()
                DatePicker("Check-out", selection: $searchParams.checkOut, displayedComponents: .date)
                    .labelsHidden()
            }
            
            HStack {
                Stepper("Adults: \(searchParams.adults)", value: $searchParams.adults, in: 1...10)
                Spacer()
                Stepper("Rooms: \(searchParams.rooms)", value: $searchParams.rooms, in: 1...5)
            }
            .font(.subheadline)
            
            Button(action: {
                // Search action
            }) {
                Label("Search", systemImage: "magnifyingglass")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
