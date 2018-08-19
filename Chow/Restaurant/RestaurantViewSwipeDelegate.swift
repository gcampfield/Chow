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
        view.layer.removeAllAnimations()
    }
    
    func didChangeSwipe(on view: SwipeView, in direction: SwipeDirection?, with translation: CGPoint) {
        view.transform = tilt(view: view, for: translation)
        shadowRestaurantView.transform = scale(shadowView: shadowRestaurantView, to: view, for: translation)
        
        // TODO: overlay meaning onto the card based on the swipe
    }
    
    func didEndSwipe(on view: SwipeView, in direction: SwipeDirection?) {
        guard let direction = direction else {
            return resetViews()
        }

        if (direction == .left || direction == .right) {
            nextViews()
        } else {
            resetViews()
        }
    }
    
    // MARK: - Helper methods

    private func resetViews() {
        return UIView.animate(
            withDuration: 0.2,
            delay: 0.0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 1.0,
            options: [ .allowUserInteraction ],
            animations: {
                self.currentRestaurantView.transform = .identity
                self.shadowRestaurantView.transform = self.scale(shadowView: self.shadowRestaurantView, to: self.currentRestaurantView)
        },
            completion: nil)
    }

    private func nextViews() {
        UIView.animate(
            withDuration: 0.2,
            animations: { self.currentRestaurantView.layer.opacity = 0.0 },
            completion: { _ in
                self.currentRestaurant = self.nextRestaurant
                self.nextRestaurant = self.restaurants.pop()

                self.currentRestaurantView.transform = .identity
                self.shadowRestaurantView.transform = self.scale(shadowView: self.shadowRestaurantView, to: self.currentRestaurantView)
            })
    }
    
    private func tilt(view: UIView, for translation: CGPoint) -> CGAffineTransform {
        let moved = CGAffineTransform(translationX: translation.x, y: translation.y)
        let rotation = sin(translation.x / view.frame.width / 4.0)
        return moved.rotated(by: rotation)
    }

    private func scale(shadowView: UIView, to view: SwipeView) -> CGAffineTransform {
        return scale(shadowView: shadowView, to: view, for: CGPoint(x: 0.0, y: 0.0))
    }

    private func scale(shadowView: UIView, to view: SwipeView, for translation: CGPoint) -> CGAffineTransform {
        let dist = translation.distanceTo(CGPoint(x: 0, y: 0))
        let percent = min(1.0, dist / view.bufferSize)
        let scaleAmount = 0.95 + (percent * 0.05)
        return CGAffineTransform.init(scaleX: scaleAmount, y: scaleAmount)
    }

}
