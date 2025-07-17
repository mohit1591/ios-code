//
//  ActivityViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/03/24.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var meetingSelectedView: UIView!
    @IBOutlet weak var pastSelectedView: UIView!
    @IBOutlet weak var upcomingSelectView: UIView!
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
    var selectedTabId = "0" // Tab Id (1 - Upcoming, 2 - Meetings, 3 - Past)
    var activity: [ActivitiesDetails]?
    var activityData: ActivitiesData?
    var currentPage = 1
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        upcomingSelected()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.contactHeaderTableViewCell)
        tableView.register(cell: Cell.activityTableViewCell)
        tableView.register(cell: Cell.searchTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    func upcomingSelected() {
        meetingSelectedView.isHidden = true
        pastSelectedView.isHidden = true
        upcomingSelectView.isHidden = false
        selectedTabId = "1"
        currentPage = 1
        getPartnersData()
    }
    
    func pastSelected() {
        meetingSelectedView.isHidden = true
        pastSelectedView.isHidden = false
        upcomingSelectView.isHidden = true
        selectedTabId = "3"
        currentPage = 1
        getPartnersData()
    }
    
    func meetingSelected() {
        meetingSelectedView.isHidden = false
        pastSelectedView.isHidden = true
        upcomingSelectView.isHidden = true
        selectedTabId = "2"
        currentPage = 1
        getMeetingData(page: currentPage)
    }
    
    func moveToActivityDetails(data: ActivitiesDetails?, isFromMeeting: Bool) {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.activityDetailVC) as? ActivityDetailViewController {
            
            vc.isFromMeeting = isFromMeeting
            vc.data = data
            vc.projectId = "\(projectId)"
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    MARK: - Action Button
    
    @IBAction func meetingTabAction(_ sender: UIButton) {
        meetingSelected()
    }
    
    @IBAction func pastTabAction(_ sender: Any) {
        pastSelected()
    }
    
    @IBAction func upcomingTabAction(_ sender: UIButton) {
        upcomingSelected()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
