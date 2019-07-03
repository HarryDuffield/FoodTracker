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

let water = Ingredient(name: "Water", unit: .ml, amount: 10)
let eggs = Ingredient(name: "Eggs", unit: nil, amount: 2)
let yeast = Ingredient(name: "Yeast", unit: .g, amount: 10)

let bread = Recipe()
bread.ingredients.append(contentsOf: [water, eggs, yeast])
bread.instructions.append(contentsOf: ["words","other words"])
bread
