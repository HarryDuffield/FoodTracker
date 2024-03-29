//
//  MealViewController.swift
//  FoodTracker
//
//  Created by  on 01/07/2019.
//

import UIKit
import os.log

class MealViewController: UIViewController , UITextFieldDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var recipeText: UILabel!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var DeleteRecipeButton: UIButton!
    @IBOutlet weak var InstructionTableViewObject: UIView!
    
    
    
    
//    var secondVC : InstructionTableViewController = InstructionTableViewController()
//    secondVC.delegate = self
//    SecondVC.callFromOtherClass() // This will call the method in the secondClass
//    // which will then ask its delegate to trigger a method valueChanged() -
//    // Who is the delegate? Well, your firstClass, so you better implement
//    // this method!
//
//
    
    
    
//    func valueChanged() -> CGFloat {
//        return meal // which is 5 in your case (value taken from a question)
//    }
    
    
    
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    var YesMeal: Meal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Set up views if editing an existing Meal.
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
            ratingControl.currentR = meal.recipe
            descTextField.text = meal.desc
            YesMeal = meal
        }
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
    }
    func returnYesMeal() -> Meal {
        return YesMeal
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    //Mark: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        print("selectedImage")
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        if let ingredientsViewController = segue.destination as? IngredientTableViewController {
            ingredientsViewController.MMeal = meal
            ingredientsViewController.tableView.reloadData()
        }
            
        else if let ingredientsViewController = segue.destination as? InstructionTableViewController {
            ingredientsViewController.MMeal = meal
            ingredientsViewController.tableView.reloadData()
        }
            
        else {
            
            // Configure the destination view controller only when the save button is pressed.
            guard let button = sender as? UIBarButtonItem, button === saveButton else {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
                return
            }
            
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            let desc = descTextField.text
            let recipe = ratingControl.currentR
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating, desc: desc ?? "", recipe: recipe)
        }
        

        
    }
    
    //MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    //MARK: Actions
    @IBAction func AddInstruction(_ sender: UIButton) {
        
        meal?.recipe?.instructions.append(" ")

    }
    @IBAction func DeleteInstruction(_ sender: UIButton) {
    }
    @IBAction func AddIngredient(_ sender: UIButton) {
        meal?.recipe?.ingredients.append(Ingredient(name: " ", unit: nil, amount: 0))
        
    }
    @IBAction func DeleteIngredient(_ sender: UIButton) {
    }
    
}
