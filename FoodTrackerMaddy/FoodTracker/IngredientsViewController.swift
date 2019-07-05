//
//  IngredientsViewController.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import UIKit
import os.log


class IngredientsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var addIngredientTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var unitPicker: UIPickerView!
    @IBOutlet weak var saveIngredientInfoButton: UIBarButtonItem!
    
    @IBAction func ingredientEditingdidEnd(_ sender: Any) {
    }
    @IBAction func amountEditingDidEndEditing(_ sender: Any) {
    }

    @IBAction func saveButton(_ sender: Any) {
        

    }
    var units = Unit.allCases
    var selectedUnit: Unit?
    var ingredient: Ingredient? {
        get {
            guard
                let nameText = addIngredientTextField.text,
                let amountText = amountTextField.text,
                let amount = Int(amountText)
                else {
                return nil
            }
           return Ingredient(name: nameText, unit: selectedUnit, amount: amount)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.unitPicker.delegate = self
        self.unitPicker.dataSource = self
    
        addIngredientTextField.delegate = self as? UITextFieldDelegate
        amountTextField.delegate = self as? UITextFieldDelegate
    

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Delegates and data sources
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return units[row].rawValue
    }
    // Number of columns of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        let unit = units[row]
        selectedUnit = unit
        
//        return
//            let ingredient.unit = units[row] as? String
    }
    
//    private func saveIngredient(){
//        let ingredient = Ingredient(amount: ingredient.amount, unit: ingredient.unit, name: ingredient.name)
//        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(ingredient, toFile: Ingredient.ArchiveURL.path)
//        if isSuccessfulSave {
//            os_log("Ingredient successfully saved.", log: OSLog.default, type: .debug)
//        } else {
//            os_log("Failed to save ingredient...", log: OSLog.default, type: .error)
//        }
//    }



    // Do any additional setup after loading the view.

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
