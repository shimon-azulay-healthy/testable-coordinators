//
//  Onboarding.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import UIKit

final class OnboardingViewController: UIViewController, PresentableOutput {
    var onFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onBoarded(_ sender: Any) {
        onFinish?()
    }
}
