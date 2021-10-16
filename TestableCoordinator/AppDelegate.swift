//
//  AppDelegate.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navController = UINavigationController()
        navController.view.backgroundColor = .white
        let router = AppRouter(navigationController: navController)

        // send that into our coordinator so that it can display view controllers
        appCoordinator = ApplicationCoordinator(router: router,
                                                coordinatorFactory: AppCoordinatorFactory(),
                                                presentableFactory: AppPresentableFactory())
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        // tell the coordinator to take over control
        appCoordinator?.start()
        
        return true
    }
}

