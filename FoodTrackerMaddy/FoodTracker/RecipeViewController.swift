//
//  RecipeViewController.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UINavigationControllerDelegate  {
    @IBAction func editIngredientsButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func addIngredientButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func addIngredientTextField(_ sender: UITextField) {
    }
    @IBAction func amountTextField(_ sender: UITextField) {
    }
    @IBAction func editInstrutionsButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func addInstructionButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func unitSwitch(_ sender: UISwitch) {
        while unitSwitch.on = true {
            unitPicker.isVisible = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
