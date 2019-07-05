//
//  RecipeViewController.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import UIKit
import os.log

class RecipeViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate  {
    
    @IBOutlet weak var editIngredientsButton:  UIButton!
    @IBOutlet weak var addIngredientButton: UIButton!
    @IBOutlet weak var editInstructionsButton: UIButton!
    @IBOutlet weak var addInstructionButton: UIButton!

    var ingredientTableViewController: IngredientTableViewController!

    var ingredients = [Ingredient]()
    
    var recipe: Recipe!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        }
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let vc = sender.source as? IngredientsViewController {
            guard let newIngredient = vc.ingredient else { return }
            ingredients.append(newIngredient)
            ingredientTableViewController.Ingredients = self.ingredients
            ingredientTableViewController.tableView.reloadData()
        }
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? IngredientTableViewController {
            ingredientTableViewController = vc
        }
    }
    
  



}
