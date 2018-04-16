//
//  VviewController.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/5/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class VviewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushCustomView(_ sender: Any) {
        let vc = CustomView(nibName: "CustomView", bundle: nil)
        self.navigationController?.show(vc, sender: self)
    }


}
