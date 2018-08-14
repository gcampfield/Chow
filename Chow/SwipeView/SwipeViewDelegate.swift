//
//  SwipeViewDelegate.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import Foundation

protocol SwipeViewDelegate: class {
    
    func didTap(view: SwipeView)
    
    func didBeginSwipe(on view: SwipeView)
    
    func didEndSwipe(on view: SwipeView, in direction: SwipeDirection?)
    
}
