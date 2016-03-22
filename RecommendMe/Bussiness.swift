//
//  Bussiness.swift
//  RecommendMe
//
//  Created by Gautam Sadarangani on 3/16/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit
import SwiftyJSON

class Bussiness: NSObject {
    
    var categories: String
    var name: String
    var address: String
    var displayAddress: String
    var latitude: Double?
    var longitude: Double?
    var numberOfReviews: Int
    var imageURL: String?
    
    init(json: JSON){
        
        
        var categoryNames = [String]()
        
        if let categoryArray = json["categories"].array {
            categoryNames = categoryArray.map { array in
                if let category = array[0].string {
                    return category
                }
                return ""
            }
        }
        
        self.categories = categoryNames.joinWithSeparator(",")  //", ".join(categoryNames)
        
        if let name = json["name"].string {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let imageURL = json["image_url"].string {
            self.imageURL = imageURL
        }
        
        self.displayAddress = ""
        self.address = ""
        if let location = json["location"].dictionary {
            if let street = location["address"]?[0].string {
                if let neighborhood = location["neighborhoods"]?[0].string {
                    self.address = "\(street), \(neighborhood)"
                } else {
                    self.address = street
                }
                if let city = location["city"]?.string {
                    if let state = location["state_code"]?.string {
                        if let zipCode = location["postal_code"]?.string {
                            self.displayAddress = "\(street), \(city) \(state) \(zipCode)"
                        } else {
                            self.displayAddress = "\(street), \(city) \(state)"
                        }
                    } else {
                        self.displayAddress = "\(street), \(city)"
                    }
                    
                } else {
                    self.displayAddress = "\(street)"
                }
            }
            
            if let coordinate = location["coordinate"]?.dictionary {
                if let latitude = coordinate["latitude"]?.number {
                    self.latitude = latitude.doubleValue
                }
                if let longitude = coordinate["longitude"]?.number {
                    self.longitude = longitude.doubleValue
                }
            }
        }
        
        if let numberOfReviews = json["review_count"].int {
            self.numberOfReviews = numberOfReviews
        } else {
            self.numberOfReviews = 0
        }
    }
    

}
