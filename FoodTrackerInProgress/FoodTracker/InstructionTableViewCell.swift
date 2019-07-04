//
//  InstructionTableViewCell.swift
//  FoodTracker
//
//  Created by  on 04/07/2019.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var InstructionText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
