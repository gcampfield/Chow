//
//  RestaurantViewSwipeDelegate.swift
//  Chow
//
//  Created by Grant Campfield on 8/18/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

extension HomeViewController {

    func didTap(view: SwipeView) {
        // TODO: segue to detail view for current restaurant
    }
    
    func didBeginSwipe(on view: SwipeView) {
        // TODO (?): handle the start of a swipe
    }
    
    func didChangeSwipe(on view: SwipeView, in direction: SwipeDirection?, with translation: CGPoint) {
        view.transform = tilt(view: view, for: translation)
        shadowRestaurantView.transform = scale(shadowView: shadowRestaurantView, to: view, for: translation)
        
        // TODO: overlay meaning onto the card based on the swipe
    }
    
    func didEndSwipe(on view: SwipeView, in direction: SwipeDirection?) {
        guard let direction = direction else {
            return UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                usingSpringWithDamping: 0.75,
                initialSpringVelocity: 1.0,
                options: [],
                animations: {
                    view.transform = .identity
                    self.shadowRestaurantView.transform = self.scale(shadowView: self.shadowRestaurantView, to: view)
                },
                completion: nil)
        }
        // TODO: animate the movement of the card off of the screen
        print("ended swipe \(direction)")
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.75,
                       initialSpringVelocity: 1.0,
                       options: [],
                       animations: { view.transform = .identity },
                       completion: nil)

        shadowRestaurantView.transform = scale(shadowView: shadowRestaurantView, to: view)
        
        // TODO: remove the card and move onto the next one
    }
    
    // MARK: - Helper methods
    
    private func tilt(view: UIView, for translation: CGPoint) -> CGAffineTransform {
        let moved = CGAffineTransform(translationX: translation.x, y: translation.y)
        let rotation = sin(translation.x / view.frame.width / 4.0)
        return moved.rotated(by: rotation)
    }

    private func scale(shadowView: UIView, to view: UIView) -> CGAffineTransform {
        return scale(shadowView: shadowView, to: view, for: CGPoint(x: 0.0, y: 0.0))
    }

    private func scale(shadowView: UIView, to view: UIView, for translation: CGPoint) -> CGAffineTransform {
        let maxDist = view.frame.width / 4.0
        let dist = translation.distanceTo(CGPoint(x: 0, y: 0))
        let percent = min(1.0, dist / maxDist)
        let scaleAmount = 0.9 + (percent * 0.1)
        return CGAffineTransform.init(scaleX: scaleAmount, y: scaleAmount)
    }

}
