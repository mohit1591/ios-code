//
//  LoginPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 09/02/24.
//

import Foundation

extension LoginViewController {
    
    func signIn() {
        Utils.showSpinner()
        
        let userName = Encryption.shared.encryptImplementation(key: encryptionKey, plaintext: (usernameTextField.text ?? ""))
        let password = Encryption.shared.encryptImplementation(key: encryptionKey, plaintext: (passwordTextField.text ?? ""))
        let deviceID = Encryption.shared.encryptImplementation(key: encryptionKey, plaintext: "eef01e906ff89e9a")
        
        let param: [String: Any] = ["username":  userName ?? "", "password": password ?? "", "device_id": deviceID ?? "", "device_token": "0"]
        debugPrint("param:::\(param)")
        
        NetworkManager.shared.loginApi(param: param, complition: {
            Utils.hideSpinner()
            self.moveToDashboard()
        })
    }
}
