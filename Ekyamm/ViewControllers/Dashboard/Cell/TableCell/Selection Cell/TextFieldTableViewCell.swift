//
//  TextFieldTableViewCell.swift
//  Ekyamm
//
//  Created by Ravi Seta on 02/12/24.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblDropDown: UILabel!
    @IBOutlet weak var dropDownView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setLayout() {
        self.lblLocation.font = AppFont.medium_14
        self.lblDropDown.font = AppFont.semibold_14
    }
}
