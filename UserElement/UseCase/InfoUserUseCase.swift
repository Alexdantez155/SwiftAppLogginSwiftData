import Foundation

protocol InfoUserUseCaseProtocol {
    func info(email: String , password: String) -> User?
}

struct InfoUserUseCase: InfoUserUseCaseProtocol {
    let database : ConfiguracionBaseProcol
    
    init(database: ConfiguracionBaseProcol) {
        self.database = database
    }
    
    func info(email: String , password: String) -> User? {
        do{
           return try database.infoUser(email: email, password: password)
        } catch {
            print("Usuario no encontrado: \(error.localizedDescription)")
            return nil
        }
    }
    
}
