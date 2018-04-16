//
//  FriendProfileVC.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/11/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class FriendProfileVC: UIViewController {

    var isLiked = false
    var match = false
    @IBOutlet weak var profilePicture: RoundableImage!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(FriendProfileVC.likeProfile))
        tap.numberOfTapsRequired = 2
        profilePicture.addGestureRecognizer(tap)

        likeButton.tintColor = .clear
    }
    
    @objc func likeProfile() {
        if !likeButton.isSelected {
            likeButtonTapped(likeButton)
        }
    }

    @IBAction func didSwitch(_ sender: UISwitch) {
        if sender.isOn {
            match = true
        } else {
            match = false
        }
    }
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        if likeButton.isSelected {
            likeButton.isSelected = false
            likeLabel.text = "Like"
        } else {
            likeLabel.text = "Liked"
            if match {
                self.likeButton.setImage(#imageLiteral(resourceName: "matched"), for: .normal)
                self.likeButton.bounce {
                    self.likeButton.setImage(#imageLiteral(resourceName: "like_icon"), for: .normal)
                    self.likeLabel.text = "Like"
                }
            } else {
                likeButton.isSelected = true
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                    self.likeButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                        self.likeButton.transform = CGAffineTransform.identity
                    }, completion: nil)
                })
            }
        }
    }
}

extension UIButton {
    func bounce(completion: () -> Void) {
        self.setImage(#imageLiteral(resourceName: "matched"), for: .normal)
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.15
        animation.autoreverses = true
        animation.repeatCount = 2
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x, y: self.center.y - 15))

        self.layer.add(animation, forKey: "bounce")

        completion()
    }
}
