//
//  ViewController.swift
//  iOS-BiometricAuth
//
//  Created by Jack Wong on 2019/04/21.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet private var successLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func login(_ sender: Any) {
        biometricAuth()
    }
}

extension ViewController {
    private func biometricAuth() {
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        var authError: NSError?
        if #available(iOS 8.0, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, error in
                    DispatchQueue.main.async {
                        if success {
                            self.successLabel.text = "Success Auth !!!!"
                        } else {
                            self.successLabel.text = "Sorry!!... User did not authenticate successfully"
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                successLabel.text = "Sorry!!.. Could not evaluate policy."
            }
        } else {
            // Fallback on earlier versions
            
            successLabel.text = "Ooops!!.. This feature is not supported."
        }
    }
  
}
