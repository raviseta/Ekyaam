//
//  CompletedPatientCell.swift
//  Ekyamm
//
//  Created by Ravi Seta on 04/12/2024.
//

import UIKit

class CompletedPatientCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPreviousSession: UILabel!
    @IBOutlet weak var lblPreviousSessionValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setLayout() {
        self.lblTime.font = AppFont.semibold_13
        self.lblPreviousSession.font = AppFont.medium_12
        self.lblPreviousSessionValue.font = AppFont.medium_12
        self.lblName.font = AppFont.semibold_13
    }
}
