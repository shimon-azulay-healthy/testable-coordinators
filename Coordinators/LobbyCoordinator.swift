//
//  LobbyCoordinator.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

final class LobbyCoordinator: BaseCoordinator {
    enum State {
        case welcomeLobby
        case symptomsLobby
        case diagnosisLobby
    }
    
    var state: State = .diagnosisLobby
    
    override func start() {
        switch state {
        case .welcomeLobby:
            showWelcomeLobby()
        case .symptomsLobby:
            showSymptomsLobby()
        case .diagnosisLobby:
            showDiagnosisLobby()
        }
    }
    
    private func showWelcomeLobby() {
        let welcomeLobby = presentableFactory.makeWelcomeLobby()
        router.setRoot(welcomeLobby, animated: true)
    }
    
    private func showSymptomsLobby() {
        var symptomsLobby = presentableFactory.makeSymptomsLobby()
        symptomsLobby.onFinish = {
            self.router.popToRootPresentable(animated: true)
            self.showWelcomeLobby()
        }
        
        router.push(symptomsLobby, animated: true)
    }
    
    private func showDiagnosisLobby() {
        var diagnosisLobby = presentableFactory.makeDiagnosisLobby()
        diagnosisLobby.onFinish = {
            self.showSymptomsLobby()
        }
        
        router.push(diagnosisLobby, animated: true)
    }
}
