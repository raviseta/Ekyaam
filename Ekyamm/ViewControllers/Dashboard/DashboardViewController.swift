//
//  DashboardViewController.swift
//  Ekyamm
//
//  Created by Ravi Seta on 02/12/24.
//

import UIKit

enum DashboardSection: Int {
    case location
    case calender
    case session
    case patientList
}

class DashboardViewController: UIViewController {

    @IBOutlet weak var tblDashboard: UITableView!
    @IBOutlet weak var btnClinicCalendar: UIButton!
    @IBOutlet weak var btnMyCalendar: UIButton!
    @IBOutlet weak var viewSeperator: NavigationView!
    
    private var activeSections: [DashboardSection] = []

    //MARK: - View cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
    }
    
    private func setupData() {
        
        tblDashboard.delegate = self
        tblDashboard.dataSource = self
        
        tblDashboard.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "TextFieldTableViewCell")
        tblDashboard.register(UINib(nibName: "PatientListCell", bundle: nil), forCellReuseIdentifier: "PatientListCell")
        tblDashboard.register(UINib(nibName: "SessionCell", bundle: nil), forCellReuseIdentifier: "SessionCell")
        tblDashboard.register(UINib(nibName: "CompletedPatientCell", bundle: nil), forCellReuseIdentifier: "CompletedPatientCell")

        self.setSections()
        
    }
    
    func setSections() {
        self.activeSections = [.location, .calender, .session, .patientList]
    }

    //MARK: - Button Actions

    @IBAction func btnMenuClicked(_ sender: UIButton) {
        self.sideMenuController?.revealMenu()
    }
    
}

//MARK: - TableView DataSource

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.activeSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = activeSections[section]
        switch sectionType {
        case .patientList:
            return 10
        case .location, .calender, .session:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionType = activeSections[indexPath.section]
        
        switch sectionType {
        case .location:
            let textFieldCell: TextFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTableViewCell", for: indexPath) as! TextFieldTableViewCell
            textFieldCell.lblLocation.text = "Select Location"
            textFieldCell.lblDropDown.text = "Chembur"

            return textFieldCell

        case .calender:
            let textFieldCell: TextFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTableViewCell", for: indexPath) as! TextFieldTableViewCell
            textFieldCell.lblLocation.text = "Select Calendar"
            textFieldCell.lblDropDown.text = "Dr. Ramesh Thakur"

            return textFieldCell

        case .session:
            let textFieldCell: SessionCell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as! SessionCell

            return textFieldCell
        case .patientList:
            if indexPath.row == 0 {
                let textFieldCell: CompletedPatientCell = tableView.dequeueReusableCell(withIdentifier: "CompletedPatientCell", for: indexPath) as! CompletedPatientCell

                return textFieldCell

            } else {
                let textFieldCell: PatientListCell = tableView.dequeueReusableCell(withIdentifier: "PatientListCell", for: indexPath) as! PatientListCell

                return textFieldCell
            }
        }
    }
}

//MARK: - TableView Delegate

extension DashboardViewController: UITableViewDelegate {
    
}
