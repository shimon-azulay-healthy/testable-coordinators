//
//  BaseCoordinator.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

class BaseCoordinator: Coordinator & CoordinatorOutput {
    var onFinish: (() -> Void)?
    let router: Router
    let coordinatorFactory: CoordinatorFactory
    let presentableFactory: PresentableFactory
    
    init(router: Router,
         coordinatorFactory: CoordinatorFactory,
         presentableFactory: PresentableFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.presentableFactory = presentableFactory
    }
    
    func start() {}
}
