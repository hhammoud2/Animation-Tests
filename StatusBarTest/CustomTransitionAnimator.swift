//
//  CustomTransitionAnimator.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/5/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class CustomTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var duration: TimeInterval = 0.5
    var operation: UINavigationControllerOperation


    init(operation: UINavigationControllerOperation) { //, isPresenting: Bool) {
        self.operation = operation
        super.init()
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let fromView = transitionContext.view(forKey: .from)!

        if self.operation == .push {
            print("Pushing")
            containerView.addSubview(toView)
            toView.frame = CGRect(x: 0, y: containerView.bounds.height, width: containerView.bounds.width, height: containerView.bounds.height)
            UIView.animate(withDuration: duration, animations: {
                toView.frame = containerView.frame
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        } else if self.operation == .pop {
            print("Popping")
            containerView.addSubview(toView)
            containerView.sendSubview(toBack: toView)
            toView.frame = containerView.frame
            UIView.animate(withDuration: duration, animations: {
                fromView.frame = CGRect(x: 0, y: containerView.bounds.height, width: containerView.bounds.width, height: containerView.bounds.height)
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
        }
    }

}
