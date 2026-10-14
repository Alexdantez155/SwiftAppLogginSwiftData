import SwiftUI

struct HomeView: View {
    let userLogin : User
    let onLogout: () -> Void
    @Environment(\.dismiss) private var dismiss
    var body: some View{
        NavigationStack{
            
            GeometryReader{ proxy in
                VStack{
                    VStack{
                        TextField("Buscar nota", text: .constant(""))
                            .textInputAutocapitalization(.never)
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                            )
                            .frame(width: 300)
                            
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.1)
                    
                    VStack(alignment: .leading,spacing: 20){
                        
                        Text("Notas semanales: ")
                            .font(.system(size: 18, weight: .bold, design: .monospaced)).foregroundStyle(.primary).padding(.horizontal)
                        
                        ScrollView(.horizontal, content: {
                            HStack{
                                CardSemanal(colorSelect: .blue.opacity(0.2), dia: "Lunes")
                                CardSemanal(colorSelect: .yellow.opacity(0.2), dia: "Martes")
                                CardSemanal(colorSelect: .orange.opacity(0.2), dia: "Miercoles")
                                CardSemanal(colorSelect: .green.opacity(0.2), dia: "Jueves")
                                CardSemanal(colorSelect: .brown.opacity(0.2), dia: "Viernes")
                            }
                            .padding(.horizontal)
                        })
                            
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.3)
                    
                    VStack(alignment: .center){
                        Text("Perfil").font(.system(size: 18, weight: .bold, design: .monospaced)).foregroundStyle(.primary)
                        Circle()
                            .fill(.gray.opacity(0.2))
                            .frame(width: 150)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.blue.opacity(0.4))
                                    .frame(width: 80)
                            )
                        
                        List{
                            Text("Nombre: \(userLogin.name)").font(.system(size: 12, weight: .bold, design: .monospaced)).foregroundStyle(.primary)
                            Text("Fecha de nacimiento: \(userLogin.age.formatted(date: .numeric, time: .omitted))").font(.system(size: 12, weight: .bold, design: .monospaced)).foregroundStyle(.primary)
                            Text("Dirección: \(userLogin.infoUser.adress)").font(.system(size: 12, weight: .bold, design: .monospaced)).foregroundStyle(.primary)
                            Text("Usuario: Premiun").font(.system(size: 12, weight: .bold, design: .monospaced)).foregroundStyle(.primary)
                        }
                        
                            
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.6)
                    
                    
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
                .background(Color(
                    red: 242.0 / 255.0,
                    green: 242.0 / 255.0,
                    blue: 247.0 / 255.0
                ))
            }

            .navigationBarBackButtonHidden()
            .toolbar{
                
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        //Opcciones
                    }, label: {
                        Label("Ménu", systemImage: "text.justify")
                    })
                    .tint(.indigo.opacity(0.6))
                })
                
                ToolbarItem(placement: .principal) {
                     Text("🌱 VIVENDI 🌱")
                         .font(.headline)
                         .fontWeight(.bold)
                 }
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        //Salir
                        dismiss()
                        onLogout()
                    }, label: {
                        Label("Salir", systemImage: "arrow.backward")
                            .labelStyle(.titleOnly)
                    })
                    .buttonStyle(.bordered)
                    .tint(.indigo.opacity(0.6))
                })
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground( Color.indigo.opacity(0.4), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
    }
}




