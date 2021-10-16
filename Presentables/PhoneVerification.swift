//
//  PhoneVerification.swift
//  TestableCoordinator
//
//  Created by Shimon Azulay on 14/05/2021.
//

import UIKit

final class PhoneVerificationViewController: UIViewController, PresentableOutput {
    var onFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func verifyPhone(_ sender: Any) {
        onFinish?()
    }
}
