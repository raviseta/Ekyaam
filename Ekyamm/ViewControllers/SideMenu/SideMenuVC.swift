//
//  SideMenuVC.swift
//  Ekyamm
//
//  Created by Ravi Seta on 04/12/2024.
//

import UIKit

struct SideMenuData {
    let img: String
    let title: String
    let shoudlShowDivider: Bool
    
    init(
        img: String,
        title: String,
        shoudlShowDivider: Bool = false
    ) {
        self.img = img
        self.title = title
        self.shoudlShowDivider = shoudlShowDivider
    }
}

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var tblMenu: UITableView!
    @IBOutlet weak var sideMenuWidthConst: NSLayoutConstraint!
    
    private var options = [SideMenuData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSideMenuOptions()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.sideMenuWidthConst.constant = SIDE_MENU_WIDTH
    }
    
    private func setSideMenuOptions() {
        self.options = [.init(img: "Dashboard", title: "Dashboard"),
                        .init(img: "Payment Due", title: "Payment Due"),
                        .init(img: "Private Notes", title: "Private Notes"),
                        .init(img: "Add User", title: "Add User"),
                        .init(img: "Calendar", title: "Calendar"),
                        .init(img: "Patients", title: "Patients", shoudlShowDivider: true),
                        .init(img: "Clinic Details", title: "Clinic Details"),
                        .init(img: "Receptionist", title: "Receptionist / Intern", shoudlShowDivider: true),
                        .init(img: "setting", title: "Settings"),
                        .init(img: "Sign Out", title: "Sign Out")
        ]
    }
}

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
        
        let option = self.options[indexPath.row]
        cell.img.image = .init(named: option.img)
        cell.lblOption.text = option.title
        cell.lblDivider.isHidden = true
        if option.shoudlShowDivider {
            cell.lblDivider.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.sideMenuController?.hideMenu()

        let vc =  AddUserVC()
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            let rootViewController = keyWindow.rootViewController
            let nav = ((rootViewController as? SideMenuController)?.contentViewController) as? UINavigationController
            nav?.pushViewController(vc, animated: true)
        }
    }
}

class SideMenuCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblOption: UILabel!
    @IBOutlet weak var lblDivider: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLayout()
    }
    
    private func setLayout() {
        self.lblOption.font = AppFont.semibold_14
    }
}
