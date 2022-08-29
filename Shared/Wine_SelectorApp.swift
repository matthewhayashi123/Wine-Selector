import SwiftUI

@main
struct Wine_SelectorApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter)
        }
    }
}


