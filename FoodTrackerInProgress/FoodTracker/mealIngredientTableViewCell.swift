import UIKit

class mealIngredientTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var IngredientText: UITextView!
    @IBOutlet weak var UnitText: UITextView!
    @IBOutlet weak var AmountText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
