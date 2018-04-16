//
//  MainTabBar.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/5/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    var customInteractor: CustomInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        for vc in self.viewControllers! {
            if let navControl = vc as? UINavigationController {
                navControl.delegate = self
            }
        }
    }

}
extension MainTabBar: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("Using animation transition from view controller")
        if toVC.isKind(of: CustomView.self) {
            self.customInteractor = CustomInteractor(attachTo: toVC)
            return CustomTransitionAnimator(operation: .push)
        } else if fromVC.isKind(of: CustomView.self) {
            return CustomTransitionAnimator(operation: .pop)
        } else {
            return nil
        }
//        print(toVC, fromVC)
//        if toVC.isKind(of: CustomView.self) {
//            print("WE DID IT")
//            return CustomTransitionAnimator(operation: operation)
//        } else if fromVC.isKind(of:CustomView.self) {
//            print("ANIMATOR")
//            return CustomView.animator as? UIViewControllerAnimatedTransitioning
//        } else {
//            return nil
//        }
    }

    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let ci = customInteractor else { return nil }
        print("INTERACT", ci.transitionInProgress)
        return ci.transitionInProgress ? customInteractor : nil
    }
    
}
