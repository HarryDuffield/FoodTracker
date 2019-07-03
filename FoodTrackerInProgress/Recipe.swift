//
//  Recipe.swift
//  FoodTracker
//
//  Created by  on 03/07/2019.
//

import UIKit

enum units {
    case kg
    case g
    case l
    case ml
    case eggs
    case tblsp
    case cups
    case oz
    case lb
}

class ingredient {
    var name: String?
    var unit: units?
}

class Recipe {
    var instructions: [String] = []
    var ingredients: [ingredient] = []
}
