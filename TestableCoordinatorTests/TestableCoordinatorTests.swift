//
//  TestableCoordinatorTests.swift
//  TestableCoordinatorTests
//
//  Created by Shimon Azulay on 18/05/2021.
//

@testable import TestableCoordinator
import XCTest

final class RouterMock: Router {
    func present(_ presentable: Presentable, animated: Bool) {
    }
    
    func push(_ presentable: Presentable, animated: Bool) {
        print("Pushed \(presentable)")
        let _ = presentable.viewController
    }
    
    func popPresentable(animated: Bool) {
    }
    
    func dismissPresentable(animated: Bool, completion: (() -> Void)?) {
    }
    
    func setRoot(_ presentable: Presentable, animated: Bool) {
        print("Set Root \(presentable)")
        let _ = presentable.viewController
    }
    
    func popToRootPresentable(animated: Bool) {
        print("Pop to root")
    }
}

final class PresentableFactoryMock: PresentableFactory {
    func makeWelcomeLobby() -> Presentable & PresentableOutput {
        PresentableMock()
    }
    
    func makeSymptomsLobby() -> Presentable & PresentableOutput {
        PresentableMock()
    }
    
    func makeDiagnosisLobby() -> Presentable & PresentableOutput {
        PresentableMock()
    }
}

class PresentableMock: Presentable, PresentableOutput {
    var viewController: UIViewController? {
        get {
            self.onFinish?()
            return nil
        }
    }
    
    var onFinish: (() -> Void)?
}

final class CoordinatorFactoryMock: CoordinatorFactory {
}

final class TestableCoordinatorTests: XCTestCase {
    
    var routerMock: Router!
    var coordinatorFactoryMock: CoordinatorFactory!
    var presentableFactoryMock: PresentableFactory!
    var lobbyCoordinator: (Coordinator & CoordinatorOutput)!

    override func setUp() {
        routerMock = RouterMock()
        coordinatorFactoryMock = CoordinatorFactoryMock()
        presentableFactoryMock = PresentableFactoryMock()
        lobbyCoordinator = LobbyCoordinator(router: routerMock,
                                            coordinatorFactory: coordinatorFactoryMock,
                                            presentableFactory: presentableFactoryMock)
    }
    
    override func tearDown() {
        lobbyCoordinator = nil
        routerMock = nil
        coordinatorFactoryMock = nil
        presentableFactoryMock = nil
    }
    
    func testFlow() {
        lobbyCoordinator.start()
    }
}

