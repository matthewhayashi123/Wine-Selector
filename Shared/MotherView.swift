import SwiftUI

struct MotherView: View {
    
    @StateObject var stateKeeper: StateKeeper

    
    var body: some View {
        
        //Works with @StateObject to pass page references through views
        switch stateKeeper.currentPage{
        case .page0:
            StartPage(viewRouter: stateKeeper)
        case .page1:
            FirstView(stateKeeper: stateKeeper)
        case .page2:
            SecondaryView(stateKeeper: stateKeeper)
        case .page3:
            TertiaryView(viewRouter: stateKeeper)
        case .page4:
            Summary(viewRouter: stateKeeper)
        }
        
        
        
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(stateKeeper: StateKeeper())
    }
}
