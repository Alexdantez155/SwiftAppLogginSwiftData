import Foundation

protocol ShowUserProtocol {
    func showUser()->[User]
}

struct ShowUserUseCase: ShowUserProtocol {
    let database : ConfiguracionBaseProcol
    
    init(database: ConfiguracionBaseProcol) {
        self.database = database
    }
    
    func showUser()->[User]{
        do{
            return try database.showUser()
        }catch{
            fatalError()
        }
    }
}
