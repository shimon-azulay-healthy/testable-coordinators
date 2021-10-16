//
//  Router.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import UIKit

public protocol Router {
    func present(_ presentable: Presentable, animated: Bool)
    func push(_ presentable: Presentable, animated: Bool)
    func popPresentable(animated: Bool)
    func dismissPresentable(animated: Bool, completion: (() -> Void)?)
    func setRoot(_ presentable: Presentable, animated: Bool)
    func popToRootPresentable(animated: Bool)
}

final class AppRouter: Router {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func present(_ presentable: Presentable, animated: Bool) {
        guard let vc = presentable.viewController else {
            return
        }
        
        navigationController.present(vc, animated: animated)
    }
    
    func push(_ presentable: Presentable, animated: Bool) {
        guard let vc = presentable.viewController else {
            return
        }
        
        navigationController.pushViewController(vc, animated: animated)
    }
    
    func popPresentable(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func dismissPresentable(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func setRoot(_ presentable: Presentable, animated: Bool) {
        guard let vc = presentable.viewController else {
            return
        }
        
        navigationController.setViewControllers([vc], animated: animated)

    }
    
    func popToRootPresentable(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
}
