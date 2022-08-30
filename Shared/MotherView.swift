import SwiftUI

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter

    
    var body: some View {
        
        //Works with @StateObject to pass page references through views
        switch viewRouter.currentPage{
        case .page0:
            StartPage(viewRouter: viewRouter)
        case .page1:
            FirstView(viewRouter: viewRouter)
        case .page2:
            SecondaryView(viewRouter: viewRouter)
        case .page3:
            TertiaryView(viewRouter: viewRouter)
        case .page4:
            Summary(viewRouter: viewRouter)
        }
        
        
        
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
