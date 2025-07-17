//
//  ActivityDetailViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 18/03/24.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    
    @IBOutlet weak var locationStack: UIStackView!
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var endTimeHeaderLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var startTimeHeaderLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endDateHeaderLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var previewCollectionView: UICollectionView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    var isFromMeeting = false
    var selectedPreviewImgIndex = 0
    var activityId = "0"
    var projectId = ""
    var meetingId = ""
    var meetingPeople: [MeetingPeople]?
    var noOfPeoples = ""
    var activityDetails : ActivityDetails?
    var allPhotos : [GetallPhotos]?
    var data: ActivitiesDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        previewView.isHidden = true
        titleLabel.text = data?.title
        descriptionLabel.text = data?.description
        startDateLabel.text = data?.start_date?.converDateInto()
        setupPreviewCollectionView()
        if isFromMeeting {
            screenTitleLabel.text = "Meeting Details"
            setupTableView()
            getMeetingDetailData()
            collectionView.isHidden = true
            tableView.isHidden = false
            locationStack.isHidden = true
            
            endDateLabel.text = data?.start_time
            endDateHeaderLabel.text = "Start Time"
            startTimeLabel.text = data?.meeting_location
            startTimeHeaderLabel.text = "Location"
            endTimeHeaderLabel.text = "No. of People"
            
            photoTitleLabel.text = "People Information"
        } else {
            screenTitleLabel.text = "Activity Details"
            setupCollectionView()
            getActivityDetailData()
            locationStack.isHidden = false
            collectionView.isHidden = false
            tableView.isHidden = true
            
            startTimeHeaderLabel.text = "Start Time"
            endTimeHeaderLabel.text = "End Time"
            endDateHeaderLabel.text = "End Date"
            photoTitleLabel.text = "Photos"

            endDateLabel.text = data?.end_date?.converDateInto()
            startTimeLabel.text = data?.start_time
            endTimeLabel.text = data?.end_time
            locationLabel.text = data?.meeting_location
        }
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cell: Cell.sdgDashboardCollectionViewCell)

        collectionView.isScrollEnabled = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView!.collectionViewLayout = layout
    }
    func setupPreviewCollectionView() {
        previewCollectionView.delegate = self
        previewCollectionView.dataSource = self
        previewCollectionView.register(cell: Cell.previewCollectionViewCell)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        previewCollectionView!.collectionViewLayout = layout
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.meetingDetailTableViewCell)
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
    }
    
//    MARK: - Button Action

    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hidePreviewAction(_ sender: UIButton) {
        previewView.isHidden = true
    }
}
