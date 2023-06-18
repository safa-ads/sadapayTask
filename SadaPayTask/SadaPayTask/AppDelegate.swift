//
//  AppDelegate.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        addInitialViewController()
        return true
    }
    
    private func addInitialViewController() {
        let storyboard = UIStoryboard(name: "GithubRepositoriesViewController", bundle:  nil)
       let viewController = storyboard.instantiateViewController(withIdentifier: "GithubRepositoriesViewController") as! GithubRepositoriesViewController
        viewController.viewModel = GithubRepositoriesViewModel()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
