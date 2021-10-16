//
//  Presentable.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import UIKit

public protocol Presentable {
    var viewController: UIViewController? { get }
}

public protocol PresentableOutput {
    var onFinish: (() -> Void)? { get set }
}

extension UIViewController: Presentable, Storyboarded {
    public var viewController: UIViewController? {
        self
    }
}
