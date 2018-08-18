//
//  SwipeView.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import UIKit

class SwipeView: UIView {
    
    var delegate: SwipeViewDelegate?
    
    private var panGestureRecognizer: UIPanGestureRecognizer?
    private var tapGestureRecognizer: UITapGestureRecognizer?
    
    var bufferMultiplier: CGFloat = 0.25
    var bufferSize: CGFloat {
        get {
            return frame.width * bufferMultiplier
        }
    }
    
    // MARK: - Setup
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initGestureRecognizers()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initGestureRecognizers()
    }
    
    // Remove the gesture recognizers when remiving the object
    deinit {
        if let panGestureRecognizer = panGestureRecognizer {
            removeGestureRecognizer(panGestureRecognizer)
        }
        if let tapGestureRecognizer = tapGestureRecognizer {
            removeGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    private func initGestureRecognizers() {
        // Pan Gesture Recognizer
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panRecognized))
        self.panGestureRecognizer = panGestureRecognizer
        addGestureRecognizer(panGestureRecognizer)
        
        // Tap Gesture Recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognized))
        self.tapGestureRecognizer = tapGestureRecognizer
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - Pan Gesture Recognizer
    
    @objc private func panRecognized(_ sender: UIPanGestureRecognizer) {
        guard let view = sender.view else { return }
        let translation = sender.translation(in: view)
        let direction = SwipeDirection.closestTo(translation, withBuffer: bufferSize)
        
        switch sender.state {
        case .began:
            delegate?.didBeginSwipe(on: self)
        case .changed:
            delegate?.didChangeSwipe(on: self, in: direction, with: translation)
        case .ended:
            delegate?.didEndSwipe(on: self, in: direction)
        default: return
        }
    }
    
    // MARK: - Tap Gesture Recognizer
    
    @objc private func tapRecognized(_ recognizer: UITapGestureRecognizer) {
        delegate?.didTap(view: self)
    }

}
