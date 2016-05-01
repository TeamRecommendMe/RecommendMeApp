//
//  Business.swift
//  RecommendMe
//
//  Created by Josh Gebbeken and Ryan Linehan on 3/16/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit

class Business: NSObject {
    
    var name: String?
    var address: String?
    var fullAddress: String?
    var cityStateZip: String?
    var city: String?
    var state: String?
    var postalCode: String?
    var rating: Double?
    var phone: String?
    var snippet: String?
    var bizURL: String?
    var imageSnippet: NSURL?
    let imageURL: NSURL?
    var replacedImageURL: String?
    let categories: String?
    let distance: String?
    let ratingImageURL: NSURL?
    let reviewCount: NSNumber?
    
    var latitude: Double?
    var longitude: Double?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        rating = dictionary["rating"] as? Double
        
        
        if let tempPhoneNumber = dictionary["display_phone"] as? String {
            let formatNumber = tempPhoneNumber.stringByReplacingOccurrencesOfString("+1-", withString: "")
            
            phone = formatNumber
        }
        
        
        if let imageURLString = dictionary["image_url"] as? String {
            
            replacedImageURL = imageURLString.stringByReplacingOccurrencesOfString("ms.jpg", withString: "l.jpg")
            
            
            imageURL = NSURL(string: replacedImageURL!)
            
            print(imageURL)
            
            
        } else {
            imageURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/c/ca/1x1.png")
        }
        
        if let imageBizSnippetURL = dictionary["image_url"] as? String {
            
            
            imageSnippet = NSURL(string: imageBizSnippetURL)
            
            print(imageSnippet)
            
            
        } else {
            imageSnippet = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/c/ca/1x1.png")
        }
        
        
        
        let location = dictionary["location"] as? NSDictionary
        var address = ""
        if location != nil {
            let addressArray = location!["display_address"] as? NSArray
            
            if addressArray != nil && addressArray!.count > 0 {
                address = addressArray![0] as! String
            }
            
            let neighborhoods = location!["neighborhoods"] as? NSArray
            if neighborhoods != nil && neighborhoods!.count > 0 {
                if !address.isEmpty {
                    address += ", "
                }
                address += neighborhoods![0] as! String
            }
            
            
            if let coordinate = location!["coordinate"] as? NSDictionary {
            
                if let latitude = coordinate["latitude"] as? Double {
                    self.latitude = latitude
                }
                if let longitude = coordinate["longitude"] as? Double {
                    self.longitude = longitude
                }
            }
            
            if let snippetText = dictionary["snippet_text"] as? String {
               self.snippet = snippetText
            }
            
            if let bizURLCheck = dictionary["url"] as? String {
                self.bizURL = bizURLCheck
            }
            
            if let bizCity = location!["city"] as? String {
                self.city = bizCity
                
            }
            if let bizState = location!["state_code"] as? String {
                self.state = bizState
            }
            
            if let bizPostalCode = location!["postal_code"] as? String {
                self.postalCode = bizPostalCode
            }
            else {
                self.postalCode = ""
            }
            
        }
        
        
        
        self.address = address
        
        print(address)
        print(city)
        print(state)
        print(postalCode)
        
        self.fullAddress = "\(address) \(city!) \(state!) \(postalCode!)"
        
        let categoriesArray = dictionary["categories"] as? [[String]]
        if categoriesArray != nil {
            var categoryNames = [String]()
            for category in categoriesArray! {
                let categoryName = category[0]
                categoryNames.append(categoryName)
            }
            categories = categoryNames.joinWithSeparator(", ")
        } else {
            categories = nil
        }
        
        
        let distanceMeters = dictionary["distance"] as? NSNumber
        if distanceMeters != nil {
            let milesPerMeter = 0.000621371
            distance = String(format: "%.2f mi", milesPerMeter * distanceMeters!.doubleValue)
        } else {
            distance = nil
        }
        
        let ratingImageURLString = dictionary["rating_img_url_large"] as? String
        if ratingImageURLString != nil {
            ratingImageURL = NSURL(string: ratingImageURLString!)
        } else {
            ratingImageURL = nil
        }
        
        reviewCount = dictionary["review_count"] as? NSNumber
    }
    
    class func businesses(array array: [NSDictionary]) -> [Business] {
        var businesses = [Business]()
        for dictionary in array {
            let business = Business(dictionary: dictionary)
            businesses.append(business)
        }
        return businesses
    }
 
 
    class func searchWithTerm(term: String, completion: ([Business]!, NSError!) -> Void) {
        YelpClient.sharedInstance.searchWithTerm(term, completion: completion)
    }
    
    class func searchWithTerm(term: String, sort: YelpSortMode?, categories: [String]?, deals: Bool?, radius_filter: Int?, completion: ([Business]!, NSError!) -> Void) -> Void {
        YelpClient.sharedInstance.searchWithTerm(term, sort: sort, categories: categories, deals: deals, radius_filter: radius_filter, completion: completion)
    }
    
    class func searchWithTermOffset(term: String, offset: Int? = 20, sort: YelpSortMode?, categories: [String]?, deals: Bool?, completion: ([Business]!, NSError!) -> Void) -> Void {
        YelpClient.sharedInstance.searchWithTermOffset(term, offset: offset!, sort: sort, categories: categories, deals: deals, completion: completion)
    }
   
}