//
//  RestaurantDeck.swift
//  Chow
//
//  Created by Grant Campfield on 8/13/18.
//  Copyright © 2018 Grant Campfield. All rights reserved.
//

import Foundation

class RestaurantDeck {
    
    let allRestaurants = [
        Restaurant(title: "Prospect", subtitle: "American (New)", imageUrls: [URL(string: "https://s3-media1.fl.yelpcdn.com/bphoto/OuBrSACvSN5dpEgg67fr3g/o.jpg")!], stars: 4.0, distance: 0.4),
        Restaurant(title: "Cafe del Sol and Many Other Words that take up lots of space", subtitle: "Mexican", imageUrls: [URL(string: "https://s3-media1.fl.yelpcdn.com/bphoto/zmp5TTiXyNAu2FfAE0o0cQ/o.jpg")!], stars: 4.2, distance: 18.5)
    ]
    var restaurants: [Restaurant]
    
    init() {
        restaurants = allRestaurants
    }
    
    func pop() -> Restaurant? {
        if restaurants.count == 0 {
            restaurants = allRestaurants
        }
        
        return restaurants.removeFirst()
    }
    
}
