//
//  MyProjectsViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/02/24.
//

import UIKit

class MyProjectsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myProjects : MyProjectsData?
    var projectList: [Projects]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func setupUI() {
        getMyProjectList()
        setupTableView()
        sideMenuDelegate = self
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(cell: Cell.myProjectsTableViewCell)
    }
    
    func moveToProjectDetails(projectId: Int) {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.myProjectDetailVC) as? ProjectDetailViewController {
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //    Button Action
    
    @IBAction func sideMenuAction(_ sender: Any) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
}

// MARK: - SideMenuDelegate

extension MyProjectsViewController: yearChangedDelegate {
    func yearChanged() {
        myProjects = nil
        projectList?.removeAll()
        getMyProjectList()
    }
}
