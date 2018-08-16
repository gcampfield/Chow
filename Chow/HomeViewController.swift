//
//  ViewController.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SwipeViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didTap(view: SwipeView) {
        // TODO: segue to detail view for current restaurant
    }
    
    func didBeginSwipe(on view: SwipeView) {
        // TODO (?): handle the start of a swipe
    }
    
    func didChangeSwipe(on view: SwipeView, with translation: CGPoint) {
        // TODO: move tilt logic from SwipeView to here
        // TODO: overlay meaning onto the card based on the swipe
        let direction = SwipeDirection.closestTo(translation)
    }
    
    func didEndSwipe(on view: SwipeView, in direction: SwipeDirection?) {
        guard let direction = direction else {
            // TODO: move the reset logic from SwipeView here
            return
        }
        // TODO: animate the movement of the card off of the screen
        // TODO: remove the card and move onto the next one
    }

}

