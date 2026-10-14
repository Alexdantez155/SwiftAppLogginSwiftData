import SwiftUI

struct storeView: View {
    @State var viewModel = userViewModel()
    @State var nameUser = ""
    @State var emailUser = ""
    @State var passUser = ""
    @State var egaUser = Date()
    @State var addressUser = ""

    var body: some View {
        NavigationStack{
            Form{
                TextField("Nombre", text: $nameUser)
                    .autocorrectionDisabled()
                TextField("Email", text: $emailUser)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Contraseña", text: $passUser)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                DatePicker(selection: $egaUser,displayedComponents: .date , label:{
                    Text("Edad")
                })
                TextField("Dirección..",text: $addressUser, axis: .vertical)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .navigationTitle("Registro")
            .toolbar{
                ToolbarItem(placement: .status, content: {
                    Button(action: {
                        let newUser = User(name: nameUser, email: emailUser,password: passUser, age: egaUser, infoUser: .init(adress: addressUser, createdAt: .now, isActivo: true))
                        viewModel.addUser(user: newUser)
                    }, label: {
                        Label("Guardar", systemImage: "square.and.pencil")
                            .labelStyle(.titleAndIcon)
                    })
                    .buttonStyle(.bordered)
                    .tint(.primary)
                })
            }
        }

    }
}

