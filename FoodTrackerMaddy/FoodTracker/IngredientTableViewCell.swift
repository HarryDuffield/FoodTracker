//
//  IngredientTableViewCell.swift
//  FoodTracker
//
//  Created by  on 05/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var UnitLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    
    //MARK: Properties
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
