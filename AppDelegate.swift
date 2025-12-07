//
//  AppDelegate.swift
//  PokemonExplorer
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // iOS 12 support
        if #available(iOS 13.0, *) {
            // handled by scene delegate
        } else {
            setupWindow()
        }
        
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tableViewController = PokemonTableViewController(style: .plain)
        let navigationController = UINavigationController(rootViewController: tableViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

