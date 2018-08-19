//
//  NibView.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import UIKit

extension UIView {
    
    func initFromNib() {
        initFromNib(withName: String.init(describing: type(of: self)))
    }
    
    func initFromNib(withName name: String) {
        let contentView = Bundle.main.loadNibNamed(name, owner: self)!.first as! UIView
        contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        contentView.frame = bounds
        addSubview(contentView)
    }

}
