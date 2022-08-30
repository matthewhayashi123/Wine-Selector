import SwiftUI

struct FirstView: View {
    @State var redOrWhiteRandom = " "
    @State var hiddenButton1 = true
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
                ZStack {
                    Image("background_red")
                        .opacity(0.8)
                    VStack {
                        Spacer()

                        HStack{
                           
                            //Return button only appears after beginning
                            //All returns will return to this view
                            if hiddenButton1 == false{
                                Button(action: {
                                    redOrWhiteRandom = " "
                                    hiddenButton1 = true
                                    
                                }, label: {
                                    Image(systemName: "return")
                                        .foregroundColor(.black)
                                    Text("StartOver")
                                        .foregroundColor(.black)
                                })
                                .padding(.leading, 250.0)
                            
                            }
                        }
                        
                        Text("Red or White Wine")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        /*
                         For future updates: the starting image is named " "
                         -Need to change logic
                         -Image should be conditional
                         */
                        Image(redOrWhiteRandom)
                            .resizable()
                            .frame(width: 300.0, height: 300.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        
                        /*
                         Same comment as image
                         -Text is currently visible displaying -> " "
                         */
                        Text(redOrWhiteRandom)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 300.0, height: 50.0)
                       
                        
                        Button(action: {
                            redOrWhiteRandom = redOrWhite()
                            hiddenButton1 = false
                        }, label: {
                            if hiddenButton1 == true{
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
                        
                        //Allows for redraw
                        if hiddenButton1 == false{
                        Button(action: {
                            viewRouter.currentPage = .page2
                            viewRouter.typeValue = redOrWhiteRandom
                        }, label: {
                            Text("Next: Choose a Region")
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


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(viewRouter:ViewRouter())
    }
}
