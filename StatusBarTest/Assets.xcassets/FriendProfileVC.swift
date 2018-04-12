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
                self.likeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                let originX = self.likeButton.center.x
                let originY = self.likeButton.center.y

                self.likeButton.setImage(#imageLiteral(resourceName: "PostLikeRed"), for: .normal)
                UIView.animate(withDuration: (0.125*6), animations: {
                    let bounceAnimation = CABasicAnimation(keyPath: "position")
                    bounceAnimation.autoreverses = true
                    bounceAnimation.repeatCount = 3
                    bounceAnimation.fromValue = [originX, originY]
                    bounceAnimation.toValue = [originX, originY - 20]
                    bounceAnimation.duration = 0.125
                    bounceAnimation.isRemovedOnCompletion = true
                    self.likeButton.layer.add(bounceAnimation, forKey: "bounce")
                }, completion: { (_) in
                    self.likeButton.setImage(#imageLiteral(resourceName: "like_icon"), for: .normal)
                    self.likeButton.transform = CGAffineTransform.identity
                    self.likeLabel.text = "Like"
                })

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
        }
    }
}
