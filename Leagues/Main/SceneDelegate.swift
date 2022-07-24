//
//  SceneDelegate.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setInitialController(to: windowScene)
    }
}

@available(iOS 13.0, *)
private extension SceneDelegate {
    
    func setInitialController(to windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: HomeFactory.getHomeViewController())
        window?.rootViewController = navigationController
        return
    }

}
