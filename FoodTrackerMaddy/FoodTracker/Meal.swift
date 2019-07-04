//
//  Meal.swift
//  FoodTracker
//
//  Created by  on 02/07/2019.
//  Copyright © 2019 Maddy Flynn. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    var comment: String?
    
    
    //MARK Archiving paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    //MARK: Init
    init?(name: String, photo: UIImage?, rating: Int, comment: String?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // the rating must be between 0 and 5 inc.
        guard (rating >= 0) && (rating <= 5) else{
            return nil
        }
    
    
        // Initialise stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        self.comment = comment
      
    }
        
        
    //MARK: Types
        
    struct PropertyKey{
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        static let comment = "comment"
       
        }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(comment, forKey: PropertyKey.comment)
       
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initialiser should fall.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
      
        // because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        let comment = aDecoder.decodeObject(forKey: PropertyKey.comment) as? String

        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating, comment: comment)
    }
}
