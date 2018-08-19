//
//  RestaurantView.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import UIKit

class RestaurantView: SwipeView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromNib()
    }

    func fill(for restaurant: Restaurant?) {
        guard let restaurant = restaurant else {
            layer.opacity = 0.0
            return
        }

        layer.opacity = 1.0
        titleLabel.text = restaurant.title
        subtitleLabel.text = restaurant.subtitle

        // TODO: get images from URL
        // imageView.image = UIImage.init(data: Data)
        switch (restaurant.title) {
        case "Prospect":
            imageView.image = #imageLiteral(resourceName: "prospect")
        case "Cafe del Sol":
            imageView.image = #imageLiteral(resourceName: "cafedelsol")
        default:
            imageView.image = #imageLiteral(resourceName: "cafedelsol")
        }
    }

}
