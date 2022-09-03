import SwiftUI

@main
struct Wine_SelectorApp: App {
    
    //Used to lock rotation, see class AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    //Used to pass results of randomization between pages -> summary page
    @StateObject var viewRouter = StateKeeper()
    
    var body: some Scene {
        WindowGroup {
            MotherView(stateKeeper: viewRouter)
        }
    }
}

//Used to lock rotation: https://stackoverflow.com/questions/66037782/swiftui-how-do-i-lock-a-particular-view-in-portrait-mode-whilst-allowing-others

class AppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.portrait //Toggle to .all to freely rotate

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
