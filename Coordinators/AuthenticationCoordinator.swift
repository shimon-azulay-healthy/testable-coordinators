//
//  AuthenticationCoordinator.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

final class AuthenticationCoordinator: BaseCoordinator {
    enum State {
        case onBoarding
        case phoneVerification
    }
    
    var state: State = .onBoarding
    
    override func start() {
        switch state {
        case .onBoarding:
            showOnboarding()
        case .phoneVerification:
            showPhoneVerification()
        }
    }
    
    private func showOnboarding() {
        var onBoarding = presentableFactory.makeOnboarding()
        onBoarding.onFinish = {
            self.router.popToRootPresentable(animated: true)
            self.showPhoneVerification()
        }
        
        router.push(onBoarding, animated: true)
    }
    
    private func showPhoneVerification() {
        var phoneVerificationCoordinator = coordinatorFactory.makePhoneVerficationCoordinator(router: router,
                                                                                              coordinatorFactory: coordinatorFactory,
                                                                                              presentableFactory: presentableFactory)
        phoneVerificationCoordinator.onFinish = {
            self.onFinish?()
        }
        
        phoneVerificationCoordinator.start()
    }
}
