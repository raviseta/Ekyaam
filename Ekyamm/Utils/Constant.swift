//
//  Constant.swift
//  Ekyamm
//
//  Created by Ravi Seta on 04/12/2024.
//

import UIKit

let SIDE_MENU_WIDTH = UIScreen.main.bounds.width / 1.8

func goToHome(window: UIWindow) {
    let contentViewController = StoryboardName.main.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
    let nav = UINavigationController(rootViewController: contentViewController)
    nav.navigationBar.isHidden = true
    
    let menuViewController = StoryboardName.main.instantiateViewController(withIdentifier: "SideMenuVC") as! SideMenuVC
    
    window.rootViewController = SideMenuController(contentViewController: nav,menuViewController: menuViewController)
    window.makeKeyAndVisible()
    
}

struct StoryboardName {
    static let main = UIStoryboard(name: "Main", bundle:nil)
}
