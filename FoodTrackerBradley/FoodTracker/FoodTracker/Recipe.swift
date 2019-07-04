//
//  Recipe.swift
//  FoodTracker
//
//  Created by  on 03/07/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    
    //MARK: Properties
    /*var quantity: Float = 0
    var unit: String = ""
    var ingredient: String = ""*/
    var quantity: Float = 0
    let units = [String]()
    let ingredients = [String]()
    let instructions = [String]()
    
    //MARK: Types
    struct PropertyKey {
        static let quantity = "quantity"
        static let units = "units"
        static let ingredients = "ingredients"
        static let instructions = "instructions"
    }
    
    //MARK: Initialization
    init (quantity: Float, units: String, ingredients: String) {
        
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(quantity, forKey: PropertyKey.quantity)
        aCoder.encode(units, forKey: PropertyKey.units)
        aCoder.encode(ingredients, forKey: PropertyKey.ingredients)
        aCoder.encode(instructions, forKey: PropertyKey.instructions)
    }
    
}
