//
//  AppDelegate.swift
//  SouleAce
//
//  Created by ideveloper9 on 08/02/24.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        Utils.shared.saveUserLogedIn(true)
        checkRegistrationFlow()
        setupThirdParty()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    class var shared: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    func checkRegistrationFlow() {
//        setAuthorizationStoryBoard()
        if Utils.shared.isUserLogedIn() {
            setMainStoryBoard()
        } else {
            setAuthorizationStoryBoard()
        }
    }
    
    func setAuthorizationStoryBoard() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigat = UINavigationController()
        navigat.isNavigationBarHidden = true
        
        let mainStoryBoard = UIStoryboard(name: StoryBoard.authorization, bundle: nil)
        let optionVc = mainStoryBoard.instantiateViewController(withIdentifier: Controller.loginVC) as? LoginViewController ?? LoginViewController()
        
        // Push the vcw  to the navigat
        navigat.pushViewController(optionVc, animated: false)
        // Set the window’s root view controller
        self.window!.rootViewController = navigat
        // Present the window
        self.window!.makeKeyAndVisible()
    }
        
    func setupThirdParty() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
    
    func setMainStoryBoard() {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigat = UINavigationController()
        navigat.isNavigationBarHidden = true
        
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        let optionVc = mainStoryBoard.instantiateViewController(withIdentifier: Controller.dashboardVC) as? DashboardViewController ?? DashboardViewController()
        
        // Push the vcw  to the navigat
        navigat.pushViewController(optionVc, animated: false)
        // Set the window’s root view controller
        self.window!.rootViewController = navigat
        // Present the window
        self.window!.makeKeyAndVisible()
        
    }
        
}
