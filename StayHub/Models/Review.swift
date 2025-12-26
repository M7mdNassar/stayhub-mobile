import Foundation

struct Review: Codable, Identifiable {
    let id: String
    let userName: String
    let rating: Int
    let comment: String
    let date: Date
}
