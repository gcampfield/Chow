//
//  HomeViewController.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, SwipeViewDelegate {

    @IBOutlet weak var shadowRestaurantView: RestaurantView!
    var nextRestaurant: Restaurant? {
        didSet {
            shadowRestaurantView.fill(for: nextRestaurant)
        }
    }

    @IBOutlet weak var currentRestaurantView: RestaurantView!
    var currentRestaurant: Restaurant? {
        didSet {
            currentRestaurantView.fill(for: currentRestaurant)
        }
    }

    let restaurants = RestaurantDeck()

    override func viewDidLoad() {
        super.viewDidLoad()

        // attach view controller as delegate for SwipeView
        currentRestaurantView.delegate = self
        currentRestaurant = restaurants.pop()
        nextRestaurant = restaurants.pop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

