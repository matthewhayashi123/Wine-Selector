import SwiftUI

struct Summary: View {
    
    @State var region1 = " "
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Image("background_red")
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack {
                
                Spacer()
                Text("Here is Your Bottle!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Maroon2"))
                
                Text("...")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Maroon2"))
                
                Text(viewRouter.typeValue)
                    .font(.title)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .frame(width: 300.0, height: 45.0)
                    .background(Color("Maroon2"))
                    .cornerRadius(15)

                Text(viewRouter.regionValue)
                    .font(.title)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .frame(width: 300.0, height: 45.0)
                    .background(Color("Maroon2"))
                    .cornerRadius(15)
                
                Text(viewRouter.varietalValue)
                    .font(.title)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .frame(width: 300.0, height: 45.0)
                    .background(Color("Maroon2"))
                    .cornerRadius(15)

                        Button(action: {
                            
                            viewRouter.currentPage = .page1
                            
                        }, label: {
                            Image(systemName: "return")
                                .foregroundColor(.black)
                            Text("StartOver")
                                .foregroundColor(.black)
                        })
                        .frame(width: 300.0, height: 45.0)
                        .background(Color("Maroon"))
                        .cornerRadius(15)
                
                Spacer()
                
            }
        }
    }
}


struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary(viewRouter:ViewRouter())
    }
}

