//
//  RecipeViewController.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit
import os.log

class RecipeViewController: /*UIViewController, UITextViewDelegate,*/ UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Ingredients.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set ingredients label and stuff
        let cell = UITableViewCell()
        cell.textLabel
        return UITableViewCell()
    }
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [Recipe]()
    
    //MARK: Actions
    @IBAction func unwindToIngredientList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? IngredientViewController, let recipe = sourceViewController.recipe {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update existing ingredient
                recipes[selectedIndexPath.row] = recipe
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add new ingredient
                let newIndexPath = IndexPath(row: recipes.count, section: 0)
                
                recipes.append(recipe)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            //saveRecipes()
            tableView.reloadData()
        }
    }
    
    //MARK: Private Methods
    

    /*
    //MARK: Properties
    @IBOutlet weak var ingredientTextView: UITextView!
    @IBOutlet weak var instructionTextView: UITextView!
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let recipe = recipe {
            let ingredientRepresentation: String = recipe.ingredients.joined(separator: "\n")
            ingredientTextView.text = ingredientRepresentation
            
            let instructionRepresentation: String = recipe.instructions.joined(separator: "\n")
            instructionTextView.text = instructionRepresentation
        }
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
//        let ingredients = ingredientTextView.text ?? ""
//        let instructions = instructionTextView.text
        
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToRecipe(sender: UIStoryboardSegue) {
    }
}
*/
}
