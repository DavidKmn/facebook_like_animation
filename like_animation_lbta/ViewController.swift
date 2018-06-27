//
//  ViewController.swift
//  like_animation_lbta
//
//  Created by Brian Voong on 6/25/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bgImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "fb_core_data_bg"))
        return imageView
    }()
    
    let iconsContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .red
        
        containerView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        bgImageView.frame = view.frame
        
        setupLongPressGesture()
    }
    
    fileprivate func setupLongPressGesture() {
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress)))
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {        
        if gesture.state == .began {
            handleGestureBegan(gesture: gesture)
        } else if gesture.state == .ended {
            iconsContainerView.removeFromSuperview()
        }
    }
    
    fileprivate func handleGestureBegan(gesture: UILongPressGestureRecognizer) {
        view.addSubview(iconsContainerView)
        
        let pressedLocation = gesture.location(in: self.view)
        print(pressedLocation)
        
        // transformation of the red box
        let centeredX = (view.frame.width - iconsContainerView.frame.width) / 2
        
        iconsContainerView.alpha = 0
        self.iconsContainerView.transform = CGAffineTransform(translationX: centeredX, y: pressedLocation.y)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.iconsContainerView.alpha = 1
            self.iconsContainerView.transform = CGAffineTransform(translationX: centeredX, y: pressedLocation.y - self.iconsContainerView.frame.height)
        })
    }
    
    override var prefersStatusBarHidden: Bool { return true }

}













