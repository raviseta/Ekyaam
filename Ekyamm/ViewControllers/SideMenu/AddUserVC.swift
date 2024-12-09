//
//  AddUserVC.swift
//  Ekyamm
//
//  Created by Jahnavi on 09/12/2024.
//

import UIKit

class AddUserVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style: .done, target:nil, action:nil)
        self.navigationItem.title = "Test"
        self.navigationController?.navigationBar.isHidden = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
