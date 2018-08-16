//
//  GradientView.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = UIColor.clear
    @IBInspectable var bottomColor: UIColor = UIColor.black.withAlphaComponent(0.7)
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [ topColor.cgColor, bottomColor.cgColor ]
    }
    
}
