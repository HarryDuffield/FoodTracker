//
//  IngredientTableViewCell.swift
//  FoodTracker
//
//  Created by  on 05/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var IngredientText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
