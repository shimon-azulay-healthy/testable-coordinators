//
//  ApplicationCoordinator.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    enum State {
        case authentication
        case lobby
    }
    
    var state: State = .authentication
    
    override func start() {
        let appVC = presentableFactory.makeMainApp()
        router.setRoot(appVC, animated: true)
        
        state == .authentication ? showLobby() : showAuthentication()
    }
    
    private func showLobby() {
        let lobbyCoordinator = coordinatorFactory.makeAuthenticationCoordinator(router: router,
                                                                                coordinatorFactory: coordinatorFactory,
                                                                                presentableFactory: presentableFactory)
        lobbyCoordinator.start()
    }
    
    private func showAuthentication() {
        var authenticationCoordinator = coordinatorFactory.makeAuthenticationCoordinator(router: router,
                                                                                         coordinatorFactory: coordinatorFactory,
                                                                                         presentableFactory: presentableFactory)
        authenticationCoordinator.onFinish = {
            self.showLobby()
        }
        
        authenticationCoordinator.start()
    }
}
