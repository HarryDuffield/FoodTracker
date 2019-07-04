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
    case unit
}

struct Ingredient {
    var name: String
    var unit: Unit?
    var amount: Int
}

class Recipe {

    var instructions: [String] = []
    var ingredients: [Ingredient] = []


    func showUnitPicker(_ sender: UISwitch) {

    }

}

let yeast = Ingredient(name: "Yeast", unit: .g, amount: 50)
let water = Ingredient(name: "Water", unit: .ml, amount: 500)
let flour = Ingredient(name: "Flour", unit: .kg, amount: 2)

let bread = [yeast, water, flour]






