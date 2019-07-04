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

    
    @IBAction func ingredientEditingdidEnd(_ sender: Any) {
    }
    
    @IBAction func instructionEditingdidEnd(_ sender: Any) {
    }
    var recipe: Recipe!
    override func viewDidLoad() {
        super.viewDidLoad()

    
//        addIngredientTextField.text = recipe.ingredient
//        amountTextField.text = recipe.amount

        

        


    

        
         // Do any additional setup after loading the view.
    }
    
    // this method lets you configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        
    }
    /*
     // MARK: - Navigation
     
      In a storyboard-based application, you will often want to do a little preparation before navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      Get the new view controller using segue.destination.
      Pass the selected object to the new view controller.
     }
     */
    
  



}
