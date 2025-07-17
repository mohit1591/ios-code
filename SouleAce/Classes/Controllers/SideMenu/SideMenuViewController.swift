//
//  SideMenuViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 12/02/24.
//

import UIKit
import SDWebImage

protocol SideMenuDelegate: AnyObject {
    func menuOpened()
    func menuClosed(isFormChangeYear: Bool)
}

enum HeaderScection: String, CaseIterable {
    case dashboard = "Dashboard"
    case project = "Project"
    case dueDiligence = "Due Diligence"
    case reportGallery = "Report & Gallery"
    case compliance = "Compliance"
    case adminModule = "Admin Module"
    case others = "Others"
    case version = "Version"
}

enum Dashboard: String, CaseIterable {
    case overview = "Overview"
    case budget = "Budget"
    case progressReporting = "Progress Reporting"
    case sdg = "SDG"
    
    var image: UIImage? {
        switch self {
        case .overview:
            return UIImage(named: "overview")
        case .budget:
            return UIImage(named: "budget")
        case .progressReporting:
            return UIImage(systemName: "filemenu.and.cursorarrow.rtl")
        case .sdg:
            return UIImage(systemName: "circle.dashed.inset.filled")
        }
    }
}

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var financialYearButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingMenuConstraint: NSLayoutConstraint!
    
    weak var delegate: SideMenuDelegate?
    let menuWidthPercentage: CGFloat = 0.79
    var showFinancialYearView = false
    var userInfo: User?
    var headerSection = HeaderScection.allCases
    var dashboardMenuList = Dashboard.allCases
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userInfo = Utils.shared.getAuthorizedUserInfo()
        userNameLabel.text = "\(userInfo?.firstName ?? "") \(userInfo?.lastName ?? "")"
        let profileImageUrl = URL(string: userInfo?.profileImage ?? "")
        profileImageView.sd_setImage(with: profileImageUrl, placeholderImage: UIImage(systemName: "person.circle"))
        
        tableView.reloadData()        
    }
    
    private func setupUI() {
        // Add gestures
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gesture:)))
        view.addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(gesture:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
       
        setupTableView()
    }
    
    func moveToLoginScreen() {
        AppDelegate.shared?.setAuthorizationStoryBoard()
        Utils.shared.resetUserData()
        Utils.shared.saveUserLogedIn(false)
    }
    
    func moveToHomeScreen() {
//        closeMenu(animation: true, isFormChangeYear: false)
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let dashBoard = mainStoryBoard.instantiateViewController(withIdentifier: Controller.dashboardVC) as? DashboardViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            print("nav::\(nav)")
            nav?.navigationController?.pushViewController(dashBoard, animated: true)
        }
    }
    
    func moveToBudgetScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let budget = mainStoryBoard.instantiateViewController(withIdentifier: Controller.budgetVC) as? BudgetViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(budget, animated: true)
        }
    }
    
    func moveToMyProjectScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let myProject = mainStoryBoard.instantiateViewController(withIdentifier: Controller.myProjectsVC) as? MyProjectsViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(myProject, animated: true)
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    
    func moveToActivityProgressScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let activityProgressVC = mainStoryBoard.instantiateViewController(withIdentifier: Controller.activityProgressVC) as? ActivityProgressViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(activityProgressVC, animated: true)
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    
    func moveToImplementingPartnersScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let sdg = mainStoryBoard.instantiateViewController(withIdentifier: Controller.implementingPartnersVC) as? ImplementingPartnersViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(sdg, animated: true)
        }
    }
    
    func moveToSDGScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let sdg = mainStoryBoard.instantiateViewController(withIdentifier: Controller.sdgVC) as? SDGViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(sdg, animated: true)
        }
    }

    func moveToReportcreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let sdg = mainStoryBoard.instantiateViewController(withIdentifier: Controller.reportVC) as? ReportViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(sdg, animated: true)
        }
    }
    
    func moveToGalleryView() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let gallery = mainStoryBoard.instantiateViewController(withIdentifier: Controller.galleryVC) as? GalleryViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(gallery, animated: true)
        }
    }
    
    func moveToNgoView() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let ngo = mainStoryBoard.instantiateViewController(identifier: Controller.ngoVC) as? NGOViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil}).first
            nav?.navigationController?.pushViewController(ngo, animated: true)
        }
    }
    
    func moveToAllUsersScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let ngo = mainStoryBoard.instantiateViewController(identifier: Controller.allUsersVC) as? AllUsersViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil}).first
            nav?.navigationController?.pushViewController(ngo, animated: true)
        }
    }
    
    func moveToCompanyProfileScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let ngo = mainStoryBoard.instantiateViewController(identifier: Controller.companyProfileVC) as? CompanyProfileViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil}).first
            nav?.navigationController?.pushViewController(ngo, animated: true)
        }
    }
    
    func moveToCSRKnowledgeBaseScreen() {
        let mainStoryBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let sdg = mainStoryBoard.instantiateViewController(withIdentifier: Controller.csrKnowledgeBaseVC) as? CSRKnowledgeBaseViewController {
            let nav = AppDelegate.shared?.window?.rootViewController?.children.filter({ $0.navigationController != nil }).first
            nav?.navigationController?.pushViewController(sdg, animated: true)
        }
    }
    
    func getAppVersion() -> String {
        guard let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String else { return  "" }
        let bundle = Bundle.main.infoDictionary!["CFBundleVersion"] ?? ""
        let appVersion = "\(Int(version) ?? 1).\(bundle)"
           return appVersion
       }
    
    //    MARK: - Button Action
    
    @IBAction func financialYearAcion(_ sender: UIButton) {
        financialYearButton.isSelected = !financialYearButton.isSelected
        showFinancialYearView.toggle()
        tableView.reloadData()
    }
    
}

// MARK: - Methods
extension SideMenuViewController {
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        gesture.setTranslation(CGPoint.zero, in: view)
        switch gesture.state {
        case .began:
            print("")
        case .changed:
            leadingMenuConstraint.constant += translation.x
            if leadingMenuConstraint.constant > 0 {
                leadingMenuConstraint.constant = 0
            }
            view.layoutIfNeeded()
        default:
            if leadingMenuConstraint.constant < -50.0 {
                closeMenu(animation: true, isFormChangeYear: false)
            } else {
                openMenu(animation: true)
            }
        }
    }
    
    @objc func handleTapGesture(gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            let touchLocation = gesture.location(in: self.view)
            if !menuView.frame.contains(touchLocation) {
                closeMenu(animation: true, isFormChangeYear: false)
            }
        }
    }
    
    func openMenu(animation: Bool) {
        financialYearButton.setTitle(selectedFinancialYear, for: .normal)
        leadingMenuConstraint.constant = 0
        self.tableView.reloadData()
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }, completion: { [weak self] (_) in
                guard let self = self else { return }
                self.delegate?.menuOpened()
            })
        } else {
            self.view.layoutIfNeeded()
            self.delegate?.menuOpened()
        }
    }
    
    func closeMenu(animation: Bool,isFormChangeYear: Bool ) {
        leadingMenuConstraint.constant = -1 * screenWidth * menuWidthPercentage
        showFinancialYearView = false
        financialYearButton.isSelected = false
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }, completion: { [weak self] (_) in
                guard let self = self else { return }
                self.delegate?.menuClosed(isFormChangeYear: isFormChangeYear)
            })
        } else {
            self.view.layoutIfNeeded()
            self.delegate?.menuClosed(isFormChangeYear: isFormChangeYear)
        }
    }
}
