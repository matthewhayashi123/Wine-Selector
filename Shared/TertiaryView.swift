import SwiftUI

struct TertiaryView: View {
    
    @State var hiddenButton3 = true
    @State var varietal1 = " "
    @State var RandomPic = " "
    @StateObject var viewRouter: StateKeeper
    
    var body: some View {
        ZStack {
            Image("background_red")
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack {
                
                Spacer()
                
                HStack{
                   
                    
                    //if hiddenButton3 == false{
                        Button(action: {
                            
                            viewRouter.currentPage = .page1
                            
                        }, label: {
                            Image(systemName: "return")
                                .foregroundColor(.black)
                            Text("StartOver")
                                .foregroundColor(.black)
                        })
                        .padding(.leading, 250.0)
                    
                    //}
                }
                
                Text("Wine Varietal")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
                Image(RandomPic)
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                Text(varietal1)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 300.0, height: 50.0)
   
                Button(action: {
                    varietal1 = varietal(viewRouter: viewRouter)
                    hiddenButton3 = false
                    RandomPic = "RandomPic"+String(Int.random(in:0...2))
                }, label: {
                    if hiddenButton3 == true{
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
                
                if hiddenButton3 == false{
                Button(action: {
                    viewRouter.varietalValue = varietal1
                    viewRouter.currentPage = .page4
                }, label: {
                    Text("Next: Summary")
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


struct TertiaryView_Previews: PreviewProvider {
    static var previews: some View {
        TertiaryView(viewRouter:StateKeeper())
    }
}
