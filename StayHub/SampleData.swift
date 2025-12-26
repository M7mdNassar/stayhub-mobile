import Foundation

extension Hotel {
    static var sampleHotels: [Hotel] {
        [
            Hotel(
                id: "1",
                name: "Plaza Hotel",
                location: "Ramallah",
                rating: 4.5,
                images: ["https://via.placeholder.com/400x300"],
                description: "Experience luxury and comfort at Plaza Hotel, located in the heart of Ramallah.",
                amenities: ["WiFi", "Room Service", "Fitness Center", "Swimming Pool"],
                pricePerNight: 100,
                discount: 20,
                chainName: "Plaza Hotels"
            ),
            Hotel(
                id: "2",
                name: "Sunset Resort",
                location: "Los Angeles",
                rating: 4.0,
                images: ["https://via.placeholder.com/400x300"],
                description: "Enjoy stunning sunset views at our luxurious resort.",
                amenities: ["Private Balcony", "Mini Bar", "WiFi", "TV"],
                pricePerNight: 150,
                discount: 15,
                chainName: "Sunset Resorts"
            ),
            Hotel(
                id: "3",
                name: "Mountain View Hotel",
                location: "Nablus",
                rating: 4.8,
                images: ["https://via.placeholder.com/400x300"],
                description: "Breathtaking mountain views with premium amenities.",
                amenities: ["WiFi", "Restaurant", "Parking", "Room Service"],
                pricePerNight: 120,
                discount: nil,
                chainName: "Mountain Hotels"
            )
        ]
    }
}

extension Room {
    static var sampleRooms: [Room] {
        [
            Room(
                id: "r1",
                hotelId: "1",
                type: "Deluxe Room",
                pricePerNight: 180,
                discount: nil,
                capacity: RoomCapacity(adults: 2, children: 1),
                amenities: ["King Size Bed", "City View", "Room Service"],
                images: ["https://via.placeholder.com/400x300"]
            ),
            Room(
                id: "r2",
                hotelId: "1",
                type: "Standard Room",
                pricePerNight: 150,
                discount: 10,
                capacity: RoomCapacity(adults: 2, children: 1),
                amenities: ["Free Wi-Fi", "TV", "Air Conditioning"],
                images: ["https://via.placeholder.com/400x300"]
            )
        ]
    }
}

extension Booking {
    static var sampleBookings: [Booking] {
        [
            Booking(
                id: "b1",
                confirmationNumber: "20240715-7595",
                hotelName: "Plaza Hotel",
                roomType: "Deluxe Suite",
                checkInDate: Date(),
                checkOutDate: Date().addingTimeInterval(172800),
                totalCost: 450,
                status: .confirmed
            ),
            Booking(
                id: "b2",
                confirmationNumber: "20240610-3421",
                hotelName: "Sunset Resort",
                roomType: "Ocean View",
                checkInDate: Date().addingTimeInterval(-2592000),
                checkOutDate: Date().addingTimeInterval(-2419200),
                totalCost: 600,
                status: .completed
            )
        ]
    }
}

extension Review {
    static var sampleReviews: [Review] {
        [
            Review(
                id: "rv1",
                userName: "Alice Johnson",
                rating: 4,
                comment: "Great hotel with excellent service. The room was clean and comfortable.",
                date: Date()
            ),
            Review(
                id: "rv2",
                userName: "John Smith",
                rating: 5,
                comment: "Amazing experience! Will definitely come back.",
                date: Date().addingTimeInterval(-86400)
            )
        ]
    }
}
