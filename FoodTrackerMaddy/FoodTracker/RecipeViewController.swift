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
    var instructionTableViewController: InstructionTableViewController!
    
    var ingredients = [Ingredient]()
    var instructions = [String?]()
    
    var recipe: Recipe? {
        get {
            return Recipe(instructions: instructions, ingredients: ingredients)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        ingredientTableViewController.Ingredients = self.ingredients
        ingredientTableViewController.tableView.reloadData()
        
        instructionTableViewController.Instructions = self.instructions
        instructionTableViewController.tableView.reloadData()
        }
    
    func setupWith(_ recipe: Recipe?) {
        ingredients = recipe?.ingredients ?? []
        instructions = recipe?.instructions ?? []
        

        
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let vc = sender.source as? IngredientsViewController {
            guard let newIngredient = vc.ingredient else { return }
            ingredients.append(newIngredient)
            ingredientTableViewController.Ingredients = self.ingredients
            ingredientTableViewController.tableView.reloadData()
        }
        
        else if let vc = sender.source as? InstructionsViewController {
            guard let newInstruction = vc.instruction else { return }
            instructions.append(newInstruction)
            instructionTableViewController.Instructions = self.instructions
            instructionTableViewController.tableView.reloadData()
            
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	        if let vc = segue.destination as? IngredientTableViewController {
            ingredientTableViewController = vc
        }
        else if let vc = segue.destination as? InstructionTableViewController {
            instructionTableViewController = vc
        }
    }
    



}
