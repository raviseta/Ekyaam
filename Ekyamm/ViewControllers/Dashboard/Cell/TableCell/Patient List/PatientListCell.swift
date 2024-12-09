//
//  PatientListCell.swift
//  Ekyamm
//
//  Created by Ravi Seta on 03/12/2024.
//

import UIKit

class PatientListCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPreviousSession: UILabel!
    @IBOutlet weak var lblPreviousSessionValue: UILabel!
    @IBOutlet weak var btnMarkCompleted: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setLayout() {
        self.lblTime.font = AppFont.semibold_16
        self.lblLocation.font = AppFont.medium_12

        self.lblPreviousSession.font = AppFont.medium_12
        self.lblPreviousSessionValue.font = AppFont.medium_12
        self.lblName.font = AppFont.semibold_16
        
        self.btnMarkCompleted.titleLabel?.font = AppFont.semibold_12
    }
}
