import SwiftUI

struct SecondaryView: View {
    
    @State var hiddenButton2 = true
    @State var region1 = " "
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Image("background_red")
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack {
                
                Spacer()
                
                HStack{
                   
                    
                   // if hiddenButton2 == false{
                        Button(action: {
                            
                            viewRouter.currentPage = .page1
                            
                        }, label: {
                            Image(systemName: "return")
                                .foregroundColor(.black)
                            Text("StartOver")
                                .foregroundColor(.black)
                        })
                        .padding(.leading, 250.0)
                    
                   // }
                }
                
                Text("Wine Region")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
                Image(region1)
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                Text(region1)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 300.0, height: 50.0)
   
                Button(action: {
                    region1 = region()
                    hiddenButton2 = false
                }, label: {
                    if hiddenButton2 == true{
                    Text("Pick for me")
                        .foregroundColor(.white)}
                    else{
                        Text("Choose again")
                            .foregroundColor(.white)
                    }
                })
                .frame(width: 300.0, height: 45.0)
                .background(Color("Maroon"))
                .cornerRadius(15)
                
                if hiddenButton2 == false{
                Button(action: {
                    viewRouter.currentPage = .page3
                    viewRouter.regionValue = region1
                }, label: {
                    Text("Next: Choose a Varietal")
                        .foregroundColor(.white)
                })
                .frame(width: 300.0, height: 45.0)
                .background(Color("Maroon2"))
                .cornerRadius(15)
                }
            
                Spacer()
                
            }
        }
    }
}


struct SecondaryView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryView(viewRouter:ViewRouter())
    }
}
