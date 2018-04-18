//
//  TestViewController.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/10/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var profilePicture: RoundableImage!
    @IBOutlet weak var likeButton: UIButton!
    var isLiked = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(TestViewController.shakeProfile))
        profilePicture.addGestureRecognizer(tap)
        profilePicture.isUserInteractionEnabled = true

    }

    @objc func shakeProfile() {
        profilePicture.shakeAnimation()
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
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.likeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                    self.likeButton.transform = CGAffineTransform.identity
                }, completion: nil)
            })
        }
        isLiked = !isLiked
    }

    @IBAction func switchTabs(_ sender: UIButton) {
        let tabBarController = self.tabBarController
        guard let numberOfTabs = tabBarController?.viewControllers?.count else { return }
        guard let selectedIndex = tabBarController?.selectedIndex else { return }

        // Remove the UIBarBackground item
        guard let tabBarItems = tabBarController?.tabBar.subviews.filter({ (view) -> Bool in
            return view.isKind(of: NSClassFromString("UITabBarButton")!)
        }) else { return }

        // Get the subview for the tab we are transitioning to
        let tabBarSelectedSubview = tabBarItems[selectedIndex + 1]

        // Get the image view on the icon for that tab
        let tabBarSelectedImageView = tabBarSelectedSubview.subviews.first
        tabBarSelectedImageView?.contentMode = .center
        if selectedIndex + 1 < numberOfTabs {
            self.bounce(view: tabBarSelectedImageView!)
            tabBarController?.selectedIndex = selectedIndex + 1
        }
    }

    func bounce(view: UIView) {
        let animation = CASpringAnimation(keyPath: "position")


        animation.duration = 0.25
        animation.autoreverses = true
        animation.repeatCount = 2
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x, y: view.center.y))

        // Bounce distance
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x, y: view.center.y - 10))

        view.layer.add(animation, forKey: "bounce")
    }

}
