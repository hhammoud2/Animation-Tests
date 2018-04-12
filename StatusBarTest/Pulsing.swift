//
//  Pulsing.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/10/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class Pulsing: CALayer {
    var animationGroup = CAAnimationGroup()
    var initialPulseScale: Float = 0
    var nextPulseAfter: TimeInterval = 0
    var animationDuration: TimeInterval = 0.75
    var radius: CGFloat = 200
    var numberOfPulses: Float = Float.infinity

    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(initialPulseScale: Float, nextPulseAfter: TimeInterval, duration: TimeInterval, radius: CGFloat, numberOfPulses: Float, position: CGPoint, backgroundColor: UIColor) {
        super.init()
        print("CREATE")
        self.backgroundColor = backgroundColor.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        self.cornerRadius = radius

        self.initialPulseScale = initialPulseScale
        self.nextPulseAfter = nextPulseAfter
        self.animationDuration = duration
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position

//        DispatchQueue.global(qos: .default).async {
            self.setupAnimationGroup()
//            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
//            }
//        }
    }

    func createScaleAnimation() -> CABasicAnimation{
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: initialPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration

        return scaleAnimation
    }

    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.5, 1]

        return opacityAnimation
    }

    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = animationDuration + nextPulseAfter
        self.animationGroup.repeatCount = numberOfPulses

        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
    }
}

class scaleImage: CALayer {

    var scale: CGFloat = 2
    var animationDuration: TimeInterval = 0.5
    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(scale: CGFloat) {
        super.init()
        self.scale = scale

        self.add(createScaleAnimation(), forKey: "scale")
    }

    func createScaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 2
        scaleAnimation.duration = animationDuration
        scaleAnimation.autoreverses = true

        return scaleAnimation
    }
}
