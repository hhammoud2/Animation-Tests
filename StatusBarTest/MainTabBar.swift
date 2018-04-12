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
                print("Found a nav")
                navControl.delegate = self
            }
        }
        print(self.navigationController?.modalPresentationStyle.rawValue)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
