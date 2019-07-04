//
//  Recipe.swift
//  FoodTracker
//
//  Created by  on 03/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
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

class Recipe {
    var instructions: [String] = []
    var ingredients: [Ingredient] = []
}



