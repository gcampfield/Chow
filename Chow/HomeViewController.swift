//
//  HomeViewController.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var shadowRestaurantView: RestaurantView!
    @IBOutlet weak var currentRestaurantView: RestaurantView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // attach view controller as delegate for SwipeView
        currentRestaurantView.delegate = RestaurantViewSwipeDelegate(currentRestaurantView, shadowView: shadowRestaurantView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

