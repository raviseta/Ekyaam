//
//  TabBarVC.swift
//  Ekyamm
//
//  Created by Ravi Seta on 05/12/2024.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setControllers()
    }
    
    private func setControllers() {
        
        let dashboardVC = StoryboardName.main.instantiateViewController(identifier: "DashboardViewController") as! DashboardViewController
        let dashboardTab = UITabBarItem(title: "Dashboard", image: UIImage(named: "dashboard_tab"), selectedImage: UIImage(named: "dashboard_tab"))
        dashboardVC.tabBarItem = dashboardTab
        
        let calenderVC = StoryboardName.main.instantiateViewController(identifier: "DashboardViewController") as! DashboardViewController
        let calenderTab = UITabBarItem(title: "Calender", image: UIImage(named: "calender_tab"), selectedImage: UIImage(named: "calender_tab"))
        calenderVC.tabBarItem = calenderTab
        
        let patientVC = StoryboardName.main.instantiateViewController(identifier: "DashboardViewController") as! DashboardViewController
        let patientTab = UITabBarItem(title: "Patients", image: UIImage(named: "patient_tab"), selectedImage: UIImage(named: "patient_tab"))
        patientVC.tabBarItem = patientTab
        
        viewControllers = [dashboardVC, calenderVC, patientVC]
        self.tabBar.tintColor = UIColor.black
        
        let fontAttributes = [
            NSAttributedString.Key.font: AppFont.medium_10
        ]
        
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .selected)
        
    }
}
