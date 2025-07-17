//
//  ActivityTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 18/03/24.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var meetingDescriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endDateHeaderLabel: UILabel!
    @IBOutlet weak var startDateHeaderLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var meetingStackView: UIStackView!
    @IBOutlet weak var upcomingPastStackView: UIStackView!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var handleKnowMoreAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
    }
    
    func fillUpcommingCell(data: ActivitiesDetails?) {
        upcomingPastStackView.isHidden = false
        meetingStackView.isHidden = true
        
        startDateLabel.text = data?.start_date?.converDateInto()
        startTimeLabel.text = data?.start_time
        endDateLabel.text = data?.end_date?.converDateInto()
        endTimeLabel.text = data?.end_time
        descriptionLabel.text = data?.description
        titleLabel.text = data?.title
    }
    
    func fillPastCell(data: ActivitiesDetails?) {
        upcomingPastStackView.isHidden = false
        meetingStackView.isHidden = true
        
        startDateLabel.text = data?.start_date?.converDateInto()
        startTimeLabel.text = data?.start_time
        endDateLabel.text = data?.end_date?.converDateInto()
        endTimeLabel.text = data?.end_time
        descriptionLabel.text = data?.description
        titleLabel.text = data?.title
    }
    
    func fillMeetingCell(data: ActivitiesDetails?) {
        upcomingPastStackView.isHidden = true
        meetingStackView.isHidden = false
        
        startDateHeaderLabel.text = "Date"
        endDateHeaderLabel.text = "Time"
        
        startDateLabel.text = data?.start_date?.converDateInto()
        endDateLabel.text = data?.start_time
        meetingDescriptionLabel.text = data?.description
        locationLabel.text = data?.meeting_location
        titleLabel.text = data?.title
    }
    
    @IBAction func knowMoreAction(_ sender: UIButton) {
        handleKnowMoreAction?()
    }
}
