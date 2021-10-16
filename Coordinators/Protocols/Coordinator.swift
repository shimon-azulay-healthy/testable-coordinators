//
//  Coordinator.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import Foundation

public protocol Coordinator {
    func start()
}

public protocol CoordinatorOutput {
    var onFinish: (() -> Void)? { get set }
}
