import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    //MARK: Types
    
    struct PropertyKey {
        
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        static let desc = "desc"
        static let recipe = "recipe"
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    var desc: String?
    var recipe: Recipe?

    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int, desc: String, recipe: Recipe?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        self.desc = desc
        self.recipe = recipe
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(recipe, forKey: PropertyKey.recipe)
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(desc, forKey: PropertyKey.desc)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }

        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        let desc = aDecoder.decodeObject(forKey: PropertyKey.desc) as? String
        
        let recipe = aDecoder.decodeObject(forKey: PropertyKey.recipe) as? Recipe
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating, desc: desc ?? "No Description", recipe: recipe)
        
    }
    
}


