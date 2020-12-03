//
//  SceneDelegate.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 01.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().isTranslucent = false
        window?.rootViewController = UINavigationController(rootViewController: AlbumCollectionAssembly().AlbumCollectionModule())
        window?.makeKeyAndVisible()
    }


}

