//
//  ViewController.swift
//  SouleAce
//
//  Created by ideveloper9 on 08/02/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        passwordTextField.isSecureTextEntry = true
    }
    
    private func validatePassword() -> Bool {
        var result = true
        
        if !passwordTextField.text!.isValidPassword {
            Utils.alert(message: "Password must contain atleast 6 characters", title: "Alert!")
            result = false
        }
        
        return result
    }
    
    func moveToDashboard() {
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.dashboardVC) as? DashboardViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //    MARK: - Button Action
    
    @IBAction func signInAction(_ sender: UIButton) {
        if usernameTextField.text?.isEmpty == false {
            if validatePassword() {
                signIn()
            }
        } else {
            Utils.alert(message: "Please enter username", title: "Alert!")
        }
    }
    
}
