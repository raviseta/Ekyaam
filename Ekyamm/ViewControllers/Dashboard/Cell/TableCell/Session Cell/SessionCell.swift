//
//  SessionCell.swift
//  Ekyamm
//
//  Created by Ravi Seta on 04/12/2024.
//

import UIKit

class SessionCell: UITableViewCell {
    
    @IBOutlet weak var CalenderCollectionView: UICollectionView!
    @IBOutlet weak var lblSession: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblUnavailibility: UILabel!
    @IBOutlet weak var lblAddSession: UILabel!
    
    private var dates: [Date] = []
    private let calendar = Calendar.current
    private var selectedDate = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLayout()
        setUpCalenderView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setLayout() {
        self.lblSession.font = AppFont.semibold_12
        self.lblDate.font = AppFont.semibold_12
        self.lblUnavailibility.font = AppFont.medium_12
        self.lblAddSession.font = AppFont.medium_12
    }
    
    private func setUpCalenderView() {
        self.CalenderCollectionView.register(UINib(nibName: "CalenderCell", bundle: nil), forCellWithReuseIdentifier: "CalenderCell")
        self.CalenderCollectionView.delegate = self
        self.CalenderCollectionView.dataSource = self
        self.generateDates()
    }
    
    private func generateDates() {
        let today = Date()
        let range = calendar.range(of: .day, in: .month, for: today)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
        
        dates = range.compactMap {
            calendar.date(byAdding: .day, value: $0 - 1, to: startOfMonth)
        }
        self.CalenderCollectionView.reloadData()
    }
}

extension SessionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CalenderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderCell", for: indexPath) as! CalenderCell
        
        let date = dates[indexPath.item]
        cell.lblDay.text = date.format(as: .weekDay)
        cell.lblDate.text = date.format(as: .day)
        
        cell.selectedView.backgroundColor = .clear
        cell.lblDay.textColor = .darkGray
        cell.lblDate.textColor = .black
        
        if selectedDate == date {
            cell.selectedView.backgroundColor = UIColor(red: 119/255, green: 110/255, blue: 165/255, alpha: 1)
            cell.lblDay.textColor = .white
            cell.lblDate.textColor = .white
            
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedDate = dates[indexPath.item]
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 80) // Set cell size
    }
}
