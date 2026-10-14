import Foundation
import SwiftData

enum errorDataBase: Error {
    case ErrorConfiguration
    case ErrorInsert
    case ErrorData
}

@MainActor
protocol ConfiguracionBaseProcol {
    func addUser(user: User) throws
    func showUser() throws -> [User]
    func infoUser(email: String , password: String) throws -> User
}


class ConfiguracionBase: ConfiguracionBaseProcol {
    
    static let shared = ConfiguracionBase()
    var modelContainer : ModelContainer
    
    private init() {
        modelContainer = ConfiguracionBase.configurationModel(isMemo: false)
    }
    
    static func configurationModel(isMemo: Bool) -> ModelContainer{
        do{
            let container = try  ModelContainer(for: User.self, configurations: ModelConfiguration(isStoredInMemoryOnly: isMemo))
            container.mainContext.autosaveEnabled = true
            return container
        } catch {
            print(error.localizedDescription)
            fatalError()
        }
    }
    
    func addUser(user: User) throws {
        do{
            modelContainer.mainContext.insert(user)
            try modelContainer.mainContext.save()
        }catch{
            print(error.localizedDescription)
            throw errorDataBase.ErrorInsert
        }
    }
    
    func showUser() throws -> [User] {
        do{
            let fetch = FetchDescriptor(predicate: nil, sortBy: [SortDescriptor<User>(\.name, order: .reverse)])
            return try modelContainer.mainContext.fetch(fetch)
        }catch{
            print(error.localizedDescription)
            throw errorDataBase.ErrorData
        }
    }
    
    func infoUser(email: String , password: String) throws -> User {
        do{
            let fetchDesciptor = FetchDescriptor<User>(
                predicate: #Predicate<User>{ user in
                    user.email == email && user.password == password
                },
                sortBy: [SortDescriptor<User>(\.name)]
            )
            let user = try modelContainer.mainContext.fetch(fetchDesciptor)
            guard let foundUser = user.first else {
                throw errorDataBase.ErrorData
            }
            return foundUser
        } catch {
            print(error.localizedDescription)
            throw errorDataBase.ErrorData
        }
    }
    
}


