import SwiftUI

struct ContentView: View {
    @State var viewModel = userViewModel()
    @State var email = ""
    @State var password = ""
    @State var isPrees = false
    @State var isCorrect = false
    
    var body: some View {
        NavigationStack {
            GeometryReader{ geometry in
                VStack{
                    
                    VStack(alignment: .center,spacing: 40){
                        
                        Text("Iniciar Sessión")
                            .font(.system(size: 28, weight: .semibold, design: .rounded))
                            .foregroundStyle(.white)
                        Image("avatar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150,height: 150)
                            .overlay{
                                Circle()
                                    .stroke(.white, lineWidth: 7)
                                    .shadow(radius: 10)
                            }
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                    
                    VStack(alignment: .center, spacing: 10){
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                            )
                            .frame(width: 300)
                        
                        SecureField("Password", text: $password)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                            )
                            .frame(width: 300)
                        
                        Spacer().frame(height: 50)
                        
                        Button(action: {
                            //Iniciar Session.
                            viewModel.infoLogin(email: email, password: password)
                            if viewModel.showMessage == false {
                                withAnimation(.smooth(duration: 0.4)) {
                                    isCorrect = viewModel.infoUserElement != nil
                                }
                            }
                            
                        }, label: {
                            Label("Entrar", systemImage: "key.horizontal")
                                .labelStyle(.titleAndIcon)
                                .frame(width: 300)
                                .foregroundStyle(.white)
                        })
                        .tint(.purple)
                        .buttonStyle(.bordered)
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                    HStack(alignment: .bottom){
                        Text("Crear cuenta: ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(.white)
                        Text("Registrate")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(.blue)
                            .underline()
                            .onTapGesture {
                                isPrees = true
                            }
                        Spacer()
                    }
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    
                }
            }
            
            .modifier(StyleFondo())
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .sheet(isPresented: $isPrees, content: {
                storeView()
                    .presentationDetents([.medium])
            })
            .alert("No se pudo iniciar sesión",
                   isPresented: $viewModel.showMessage) {
                Button("Entendido", role: .cancel) { }
            } message: {
                Text("Credenciales incorrectas")
            }
            .onAppear{
                viewModel.showUsers()
            }
            .navigationDestination(isPresented: $isCorrect, destination: {
                if let user = viewModel.infoUserElement {
                    HomeView(userLogin: user) {
                         email = ""
                         password = ""
                         isCorrect = false
                     }
                }
            })
            
        }

    }
    
}

#Preview {
    ContentView()
}
