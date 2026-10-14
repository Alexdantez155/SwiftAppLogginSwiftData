import Foundation

protocol AltaUserUseCaseProcol {
    func altaUser(user: User)
}

struct AltaUserUseCase:  AltaUserUseCaseProcol {
    
    let database :  ConfiguracionBaseProcol
    
    init(database: ConfiguracionBaseProcol) {
        self.database = database
    }
    
    func altaUser(user: User)  {
        do{
            try database.addUser(user: user)
        }catch{
            print(error.localizedDescription)
            fatalError()
        }
    }
    
}
