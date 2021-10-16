//
//  PresentableFactory.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

public protocol PresentableFactory {
    func makeMainApp() -> Presentable
    func makeWelcomeLobby() -> Presentable & PresentableOutput
    func makeSymptomsLobby() -> Presentable & PresentableOutput
    func makeDiagnosisLobby() -> Presentable & PresentableOutput

    func makeOnboarding() -> Presentable & PresentableOutput
    
    func makePhoneVerification() -> Presentable & PresentableOutput
    func makePinCode() -> Presentable & PresentableOutput
}

extension PresentableFactory {
    func makeMainApp() -> Presentable {
        AppViewController.instantiate()
    }
    
    func makeWelcomeLobby() -> Presentable & PresentableOutput {
        WelcomeLobbyViewController.instantiate()
    }
    
    func makeSymptomsLobby() -> Presentable & PresentableOutput {
        SymptomsLobbyViewController.instantiate()
    }
    
    func makeDiagnosisLobby() -> Presentable & PresentableOutput {
        DiagnosisLobbyViewController.instantiate()
    }

    func makeOnboarding() -> Presentable & PresentableOutput {
        OnboardingViewController.instantiate()
    }
    
    func makePhoneVerification() -> Presentable & PresentableOutput {
        PhoneVerificationViewController.instantiate()
    }
    
    func makePinCode() -> Presentable & PresentableOutput {
        PinCodeViewController.instantiate()
    }
}

final class AppPresentableFactory: PresentableFactory {}
