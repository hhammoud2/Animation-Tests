//
//  HapticViewController.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/26/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class HapticViewController: UIViewController {

    let impactLight = UIImpactFeedbackGenerator(style: .light)
    let impactMedium = UIImpactFeedbackGenerator(style: .medium)
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)

    let selection = UISelectionFeedbackGenerator()
    let notification = UINotificationFeedbackGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func impactLight(_ sender: UIButton) {
        impactLight.impactOccurred()
    }

    @IBAction func impactMedium(_ sender: UIButton) {
        impactMedium.impactOccurred()
    }

    @IBAction func impactHeavy(_ sender: UIButton) {
        impactHeavy.impactOccurred()
    }

    @IBAction func selection(_ sender: UIButton) {
        selection.selectionChanged()
    }

    @IBAction func success(_ sender: UIButton) {
        notification.notificationOccurred(.success)
    }

    @IBAction func warning(_ sender: UIButton) {
        notification.notificationOccurred(.warning)
    }

    @IBAction func error(_ sender: UIButton) {
        notification.notificationOccurred(.error)
    }




}
