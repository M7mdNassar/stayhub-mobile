import Foundation

struct SearchParams : Decodable, Encodable {
    var destination: String = ""
    var checkIn: Date = Date()
    var checkOut: Date = Date().addingTimeInterval(86400)
    var adults: Int = 2
    var children: Int = 0
    var rooms: Int = 1
}
