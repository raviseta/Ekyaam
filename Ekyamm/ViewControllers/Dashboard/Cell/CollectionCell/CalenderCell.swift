//
//  CalenderCell.swift
//  Ekyamm
//
//  Created by Ravi Seta on 04/12/2024.
//

import UIKit

class CalenderCell: UICollectionViewCell {

    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblDate: UILabel!

    @IBOutlet weak var selectedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setLayout()
    }

    
    private func setLayout() {
        self.lblDay.font = AppFont.medium_11
        self.lblDay.font = AppFont.semibold_14
        

    }

}

