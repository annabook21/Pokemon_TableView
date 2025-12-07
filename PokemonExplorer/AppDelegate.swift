//
//  AppDelegate.swift
//  PokemonExplorer
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let pokemonList = PokemonTableViewController(style: .plain)
        let nav = UINavigationController(rootViewController: pokemonList)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}

