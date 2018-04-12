//
//  ViewController.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/3/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isStatusHidden = false
    override var prefersStatusBarHidden: Bool {
        return isStatusHidden
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    let vc = CustomView(nibName: "CustomView", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTap(_ sender: Any) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

