//
//  CustomView.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/5/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class CustomView: UIViewController {

    static var animator: UIPercentDrivenInteractiveTransition?
    var initialTouchPoint = CGPoint.zero
    var isPanGestureValid = false
    var previousView: UIViewController?

    @IBOutlet weak var customView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Pan/Tap gesture to dismiss
        let swipeDownDismiss = UIPanGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
//        swipeDownDismiss.delegate = self
//        self.view.addGestureRecognizer(swipeDownDismiss)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func OnLeftMenuClicked() {
        self.navigationController?.popViewController(animated: true)
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

extension CustomView: UIGestureRecognizerDelegate {
    @objc func swipeDown(_ sender: UIPanGestureRecognizer) {

//        let translate = sender.translation(in: self.view)
//        let percent = translate.y / self.view.bounds.size.height
//        print(percent)
//        if sender.state == .began {
//            CustomView.animator = UIPercentDrivenInteractiveTransition()
//            self.navigationController?.popViewController(animated: true)
//        } else if sender.state == .changed {
//            CustomView.animator?.update(percent)
//        } else if sender.state == .ended {
//            let velocity = sender.velocity(in: self.view)
//            if percent > 0.1 && velocity.y > 0 {
//                CustomView.animator?.finish()
//            } else {
//                CustomView.animator?.cancel()
//            }
//            CustomView.animator = nil
//        }
        let touchPoint = sender.location(in: self.view?.window)
        let swipeSensitivity: CGFloat = 100

        if sender.state == .began {
            isPanGestureValid = true
            initialTouchPoint = touchPoint

        } else if sender.state == .changed && isPanGestureValid {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.customView.frame = CGRect(x: 0, y: (touchPoint.y - initialTouchPoint.y), width: self.customView.frame.size.width, height: self.customView.frame.size.height)
            }
        } else if ((sender.state == .ended || sender.state == .cancelled) && isPanGestureValid) {
            if touchPoint.y - initialTouchPoint.y > swipeSensitivity {
                self.modalPresentationStyle = .overCurrentContext
                self.navigationController?.popViewController(animated: true)
            } else {
                isPanGestureValid = false
                UIView.animate(withDuration: 0.3, animations: {
                    self.customView.frame = CGRect(x: 0, y: 0, width: self.customView.frame.size.width, height: self.customView.frame.size.height)
                }, completion: { (_) in
                })
            }
        } else {
            isPanGestureValid = false
        }
    }

    
}
