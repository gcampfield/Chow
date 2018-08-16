//
//  SwipeViewDelegate.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import Foundation
import CoreGraphics

protocol SwipeViewDelegate: class {
    
    func didTap(view: SwipeView)
    
    func didBeginSwipe(on view: SwipeView)
    
    func didChangeSwipe(on view: SwipeView, in direction: SwipeDirection?, with translation: CGPoint)

    func didEndSwipe(on view: SwipeView, in direction: SwipeDirection?)
    
}
