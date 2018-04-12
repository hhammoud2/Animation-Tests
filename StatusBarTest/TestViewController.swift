//
//  TestViewController.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/10/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    var isLiked = false

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(TestViewController.addPulse))
        profilePicture.addGestureRecognizer(tap)

    }

    @objc func addPulse() {
        let imageRadius = profilePicture.frame.size.width / 2
        let pulse = Pulsing(initialPulseScale: 0.6, nextPulseAfter: 0, duration: 0.75, radius: imageRadius + 35, numberOfPulses: 1, position: profilePicture.center, backgroundColor: UIColor.init(red: 0.0, green: 0.1843137255, blue: 0.3647058824, alpha: 1))
        self.view.layer.insertSublayer(pulse, below: profilePicture.layer)
    }

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        if isLiked {
            likeButton.isSelected = false
        } else {
            likeButton.isSelected = true
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
                self.likeButton.transform = CGAffineTransform(scaleX: 2, y: 2)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
                    self.likeButton.transform = CGAffineTransform.identity
                }, completion: nil)
            })
        }
        isLiked = !isLiked
    }
}
