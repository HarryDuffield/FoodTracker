//
//  RecipeViewController.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITextViewDelegate {
    
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
        
        let ingredients = ingredientTextView.text ?? ""
        let instructions = instructionTextView.text
        
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
