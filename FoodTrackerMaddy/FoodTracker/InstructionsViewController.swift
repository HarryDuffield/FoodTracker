//
//  InstructionsViewController.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addInstructionTextField: UITextField!
    @IBOutlet weak var saveInstructionButton: UIBarButtonItem!
    
    @IBAction func instructionEditingdidEnd(_ sender: Any) {
    }
    
    var instruction: String?
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addInstructionTextField.delegate = self as? UITextFieldDelegate
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
//        if let vc = sender.source as? InstructionsViewController {
//            guard let newInstruction = vc.instruction else { return }
//            instruction.append(newInstruction)
//            InstructionTableViewController.Instructions = self.instruction
//            InstructionTableViewController.tableView.reloadData()
//        }
//
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? InstructionsViewController {
//            InstructionTableViewController = vc
//        }
//    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        instruction = textField.text
        return true
    }

}
