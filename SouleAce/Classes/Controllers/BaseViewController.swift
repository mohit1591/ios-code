//
//  BaseViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 16/02/24.
//

import UIKit
import AVFoundation

class BaseViewController: UIViewController {
    
    var sideMenuController: SideMenuViewController?
    var sideMenuView: UIView!
    var sideMenuDelegate: yearChangedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    private func setupMenu() {
        sideMenuController = storyboard?.instantiateViewController(identifier: Controller.sideMenuVC)
        sideMenuView = UIView(frame: UIScreen.main.bounds)
        self.sideMenuView.isHidden = true
        
        if let child = sideMenuController {
            child.delegate = self
            child.view.frame = sideMenuView.frame
            sideMenuView.addSubview(child.view)
        }
        sideMenuController?.closeMenu(animation: false, isFormChangeYear: false)
        AppDelegate.shared?.window?.addSubview(sideMenuView)
    }
    
}

// MARK: - SideMenuDelegate

extension BaseViewController: SideMenuDelegate {

    func menuOpened() {
    }

    func menuClosed(isFormChangeYear: Bool) {
        if isFormChangeYear {
            sideMenuDelegate?.yearChanged()
        }
        self.sideMenuView.isHidden = true
    }

}

extension BaseViewController:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
