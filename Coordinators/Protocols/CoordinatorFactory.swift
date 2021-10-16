//
//  CoordinatorFactory.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

public protocol CoordinatorFactory {
    func makeLobbyCoordinator(router: Router,
                              coordinatorFactory: CoordinatorFactory,
                              presentableFactory: PresentableFactory) -> Coordinator & CoordinatorOutput
    func makeAuthenticationCoordinator(router: Router,
                                       coordinatorFactory: CoordinatorFactory,
                                       presentableFactory: PresentableFactory) -> Coordinator & CoordinatorOutput
    func makePhoneVerficationCoordinator(router: Router,
                                         coordinatorFactory: CoordinatorFactory,
                                         presentableFactory: PresentableFactory) -> Coordinator & CoordinatorOutput
}

extension CoordinatorFactory {
    func makeLobbyCoordinator(router: Router,
                              coordinatorFactory: CoordinatorFactory,
                              presentableFactory: PresentableFactory) -> Coordinator & CoordinatorOutput {
        LobbyCoordinator(router: router, coordinatorFactory: coordinatorFactory, presentableFactory: presentableFactory)
    }
    
    func makeAuthenticationCoordinator(router: Router,
                                       coordinatorFactory: CoordinatorFactory,
                                       presentableFactory: PresentableFactory) -> Coordinator & CoordinatorOutput {
        AuthenticationCoordinator(router: router, coordinatorFactory: coordinatorFactory, presentableFactory: presentableFactory)
    }
    
    func makePhoneVerficationCoordinator(router: Router,
                                         coordinatorFactory: CoordinatorFactory,
                                         presentableFactory: PresentableFactory) -> Coordinator & CoordinatorOutput {
        PhoneVerficationCoordinator(router: router, coordinatorFactory: coordinatorFactory, presentableFactory: presentableFactory)
    }
}

final class AppCoordinatorFactory: CoordinatorFactory {}
