//
//  CustomInteractor.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/5/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class CustomInteractor: UIPercentDrivenInteractiveTransition {
    var navigationController: UINavigationController
    var shouldCompleteTransition = false
    var transitionInProgress = false
    var initialTouchPoint = CGPoint.zero

    init?(attachTo viewController: UIViewController) {
        if let nav = viewController.navigationController {
            self.navigationController = nav
            super.init()
            setupSwipeDownGesture(view: viewController.view)
        } else {
            return nil
        }
    }

    private func setupSwipeDownGesture(view: UIView) {
        print("Adding swipe gesture")
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
        swipeDownGesture.direction = .down
        swipeDownGesture.delegate = self
        print(view)
        view.addGestureRecognizer(swipeDownGesture)
    }

    @objc private func swipeDown(_ gesture: UISwipeGestureRecognizer) {
        let touchPoint = gesture.location(in: gesture.view)
        if initialTouchPoint == CGPoint.zero {
            initialTouchPoint = touchPoint
        }
        let percent = initialTouchPoint.y / touchPoint.y
        switch gesture.state {
        case .began:
            print("began")
            transitionInProgress = true
            navigationController.popViewController(animated: true)
        case .changed:
            print("Changed")
            shouldCompleteTransition = (1 - percent) > 0.5
            update(percent)
        case .cancelled:
            print("canceled")
            transitionInProgress = false
            cancel()
        case .ended:
            print("ended")
            transitionInProgress = false
            shouldCompleteTransition ? finish() : cancel()
        default:
            print("default")
            return
        }
    }
}
extension CustomInteractor: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print(gestureRecognizer, otherGestureRecognizer)
        return true
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print(gestureRecognizer)
        return true
    }
}
