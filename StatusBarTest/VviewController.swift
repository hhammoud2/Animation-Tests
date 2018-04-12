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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushCustomView(_ sender: Any) {
        let vc = CustomView(nibName: "CustomView", bundle: nil)
        print(vc.modalPresentationStyle.hashValue)
        self.navigationController?.show(vc, sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
