//
//  SwipeDirection.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import Foundation
import CoreGraphics

enum SwipeDirection {
    
    case up
    case right
    case down
    case left
    
    var point: CGPoint {
        switch self {
        case .up:    return CGPoint(x:  0, y: -1)
        case .right: return CGPoint(x:  1, y:  0)
        case .down:  return CGPoint(x:  0, y:  1)
        case .left:  return CGPoint(x: -1, y:  0)
        }
    }
    
    static let all: [SwipeDirection] = [ .up, .right, .down, .left ]
    
    static func closestTo(_ point: CGPoint) -> SwipeDirection? {
        return closestTo(point, withBuffer: 0.0)
    }
    
    static func closestTo(_ point: CGPoint, withBuffer buffer: CGFloat) -> SwipeDirection? {
        return all.reduce((distance: CGFloat.infinity, direction: nil), { closest, direction -> (CGFloat, SwipeDirection?) in
            let distance = direction.point.distanceTo(point)
            if distance < closest.distance && distance >= buffer {
                return (distance, direction)
            }
            return closest
        }).direction
    }
    
}
