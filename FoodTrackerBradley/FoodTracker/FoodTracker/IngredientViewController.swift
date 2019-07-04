//
//  IngredientViewController.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit
import os.log

class IngredientViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    /*@IBAction func ingredientTextField(_ sender: Any) {
    }*/
    
    //MARK: Properties
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let recipe = recipe {
            
        }
        
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button wasn't pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let ingredients = ingredientTextField.text ?? ""
        
        recipe = Recipe(quantity: 0, units: "test", ingredients: ingredients)
        print(recipe?.ingredients)
        
    }
    
    
    

}
