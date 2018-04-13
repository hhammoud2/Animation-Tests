//
//  RoundableImage.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/10/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class RoundableImage: UIImageView {

    override func layoutSubviews() {
        print(self.frame)
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
    }

    func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 2.5, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 2.5, y: self.center.y))

        self.layer.add(animation, forKey: "shake")
    }

}
