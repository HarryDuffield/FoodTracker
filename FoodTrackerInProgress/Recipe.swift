//
//  Recipe.swift
//  FoodTracker
//
//  Created by  on 03/07/2019.
//

import UIKit

enum Unit: String {
    case kg = "kg"
    case g = "g"
    case l = "l"
    case ml = "ml"
    case tblsp = "tblsp"
    case cups = "cups"
    case oz = "oz"
    case lb = "lb"
}

class Ingredient: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(amount, forKey: PropertyKey.amount)
        
        if let unitString = unit?.rawValue {
            aCoder.encode(unitString, forKey: PropertyKey.unit)
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let unitRaw = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let amount = aDecoder.decodeInteger(forKey: PropertyKey.amount)

        self.init(name: name, unit: Unit(rawValue: unitRaw), amount: amount)
    }
    
    var name: String
    var unit: Unit?
    var amount: Int
    
    struct PropertyKey {
        static let name = "name"
        static let unit = "unit"
        static let amount = "amount"
    }
    
    init(name: String, unit: Unit?, amount: Int) {
        self.name = name
        self.unit = unit
        self.amount = amount
    }
}

class Recipe: NSObject, NSCoding {
    struct PropertyKey {
        static let instructions = "instructions"
        static let ingredients = "ingredients"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(instructions, forKey: PropertyKey.instructions)
        aCoder.encode(ingredients, forKey: PropertyKey.ingredients)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let instructions = aDecoder.decodeObject(forKey: PropertyKey.instructions) as! [String]
        let ingredients = aDecoder.decodeObject(forKey: PropertyKey.ingredients) as! [Ingredient]
        
        self.init(instructions: instructions, ingredients: ingredients)
    }
    
    init(instructions: [String], ingredients: [Ingredient]) {
        self.ingredients = ingredients
        self.instructions = instructions
    }
    
    var instructions: [String] = []
    var ingredients: [Ingredient] = []
}


