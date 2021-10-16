//
//  PhoneVerficationCoordinator.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

final class PhoneVerficationCoordinator: BaseCoordinator {
    enum State {
        case phoneVerification
        case pinCode
    }
    
    var state: State = .phoneVerification
    
    override func start() {
        switch state {
        case .phoneVerification:
            showPhoneVerification()
        case .pinCode:
            showPinCode()
        }
    }
    private func showPhoneVerification() {
        var phoneVerification = presentableFactory.makePhoneVerification()
        phoneVerification.onFinish = {
            self.showPinCode()
        }
        
        router.push(phoneVerification, animated: true)
    }
    
    private func showPinCode() {
        var pinCode = presentableFactory.makePinCode()
        pinCode.onFinish = {
            self.router.popToRootPresentable(animated: true)
            self.onFinish?()
        }
        
        router.push(pinCode, animated: true)
    }
}
