//
//  Recipe.swift
//  FoodTracker
//
//  Created by  on 03/07/2019.
//

import UIKit

enum Unit {
    case kg
    case g
    case l
    case ml
    case tblsp
    case cups
    case oz
    case lb
}

struct Ingredient {
    var name: String
    var unit: Unit?
    var amount: Int
}

struct Recipe {
    var instructions: [String] = []
    var ingredients: [Ingredient] = []
}


