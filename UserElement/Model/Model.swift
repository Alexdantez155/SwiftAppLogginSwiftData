import Foundation
import SwiftData



@Model
class User {
    @Attribute(.unique) var id : UUID
    var name : String
    var email :  String
    var password : String
    var age : Date
    @Relationship(deleteRule: .cascade)
    var infoUser : InfoUser
    
    init(id: UUID = UUID(), name: String, email: String,password: String, age: Date, infoUser: InfoUser) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.age = age
        self.infoUser = infoUser
    }
}


@Model
class InfoUser {
    var adress : String
    var createdAt : Date
    var isActivo :  Bool
    
    init(adress: String, createdAt: Date, isActivo: Bool) {
        self.adress = adress
        self.createdAt = createdAt
        self.isActivo = isActivo
    }
}
