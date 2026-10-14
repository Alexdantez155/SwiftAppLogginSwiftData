import SwiftUI

struct StyleFondo: ViewModifier {

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 52/255, green: 224/255, blue: 237/255), // Cian brillante arriba
                        Color(red: 110/255, green: 150/255, blue: 242/255), // Azul intermedio
                        Color(red: 175/255, green: 141/255, blue: 220/255)  // Lila suave abajo
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
    }
    
}

struct CardSemanal: View {
    var colorSelect: Color
    var dia: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(colorSelect)
            .frame(width: 120, height: 120)
            .overlay(
                VStack(alignment: .center){
                    Text(dia).font(.system(size: 16, weight: .bold, design: .monospaced)).foregroundStyle(.primary)
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white)
                }
            )
            
    }
}
