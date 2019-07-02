//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by  on 01/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {

    //MARK: Meal Class Tests
    
    // confirm tht the meal initialiser returns a Meal objects when passed valid parameters.
    func testMealInitializationSucceeds(){
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // highest possible rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
    }
    // confirm that the meal initialiser returns nil when passed a negativerating or an empty name
    func testMealInitializionFails(){
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
}
