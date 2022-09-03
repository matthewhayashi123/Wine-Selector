import SwiftUI

struct SecondaryView: View {
    
    @State var hiddenButton2 = true
    @State var region1 = " "
    @StateObject var stateKeeper: StateKeeper
    
    var body: some View {
        ZStack {
            Image("background_red")
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack {
                
                Spacer()
                
                HStack{
                   
                    
                   // Always show return button going forward
                        Button(action: {
                            
                            stateKeeper.currentPage = .page2
                            
                        }, label: {
                            Image(systemName: "return")
                                .foregroundColor(.black)
                            Text("StartOver")
                                .foregroundColor(.black)
                        })
                        .padding(.leading, 250.0) //Places return button on right side of screen
                    

                }
                
                Text("Wine Region")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
                Image(stateKeeper.regionValue)
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                Text(stateKeeper.regionValue)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 300.0, height: 50.0)
   
                Button(action: {
                    stateKeeper.region()
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
                    stateKeeper.currentPage = .page3

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
        SecondaryView(stateKeeper:StateKeeper())
    }
}
