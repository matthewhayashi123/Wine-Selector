import SwiftUI

struct StartPage: View {

    @StateObject var viewRouter: StateKeeper
    
    var body: some View {
                ZStack {
                    Image("background_red")
                        .opacity(0.8)
                    VStack {

                        Text("Let me help you pick out a bottle of wine!")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .frame(width: 300)
                            .foregroundColor(.white)
                        Button(action: {
                            viewRouter.currentPage = .page2
                        }, label: {
                            Text("Let's Begin")
                                .foregroundColor(.white)
                        })
                        .frame(width: 300.0, height: 45.0)
                        .background(Color("Maroon"))
                        .cornerRadius(15)
                    }
                        
                        Spacer()
                        
                }
        }
}


struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage(viewRouter:StateKeeper())
    }
}
