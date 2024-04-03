import Foundation


struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable,Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
    
    
    static var mock: User {
        User(
            id: 323,
            firstName: "Rutik",
            lastName: "",
            age: 23,
            email: "abc@ss.com",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 120,
            weight: 20
        )
    }
}
