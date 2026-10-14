import Foundation
import Observation



@MainActor
@Observable
class userViewModel {

    var userData: [User] = []
    var infoUserElement : User? = nil
    var showMessage = false
    
    var altaUserUseCase : AltaUserUseCaseProcol
    var showUser : ShowUserProtocol
    var infoUser : InfoUserUseCaseProtocol
    
    init() {
        self.altaUserUseCase = AltaUserUseCase(database: ConfiguracionBase.shared)
        self.showUser = ShowUserUseCase(database: ConfiguracionBase.shared)
        self.infoUser = InfoUserUseCase(database: ConfiguracionBase.shared)
    }
    //Inyeccion o Test
    init(altaUserUseCase: AltaUserUseCaseProcol, showUser : ShowUserProtocol, infoUser : InfoUserUseCaseProtocol){
        self.altaUserUseCase = altaUserUseCase
        self.showUser = showUser
        self.infoUser = infoUser
    }
    
    func addUser(user: User){
        altaUserUseCase.altaUser(user: user)
        showUsers()
    }
    
    func showUsers(){
       userData = showUser.showUser()
    }
    
    func infoLogin(email: String , password : String){
        let search = infoUser.info(email: email, password: password)
        guard let user = search else {
            infoUserElement = nil
            showMessage = true
            print("Credenciales incorrectas")
            return
        }
        showMessage = false
        infoUserElement = user
    }
    
}
