//
//  YelpClient.swift
//  RecommendMe
//
//  Created by Josh Gebbeken and Ryan Linehan on 3/16/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//


import UIKit
import AFNetworking
import BDBOAuth1Manager


let yelpConsumerKey = "z51rSEd4Ff086dZ9-3kdtg"
let yelpConsumerSecret = "oKKtsHDbyvjvEg2xQQwNkMz0vTY"
let yelpToken = "JzxmlIQgzSkjem4IAkXoL3Ic4JKZcYg2"
let yelpTokenSecret = "2kW5csc-E1ynlRG1E_JrZabLFe4"

var latitude: Double!
var longitude: Double!
let coordDefaults = NSUserDefaults.standardUserDefaults()

let manager = AFHTTPSessionManager()


enum YelpSortMode: Int {
    case BestMatched = 0, Distance = 1, HighestRated
}

class YelpClient: BDBOAuth1SessionManager {
    var accessToken: String!
    var accessSecret: String!
    
    
    

    class var sharedInstance : YelpClient {
        struct Static {
            static var token : dispatch_once_t = 0
            static var instance : YelpClient? = nil
        }
        
        dispatch_once(&Static.token) {
            Static.instance = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        }
        return Static.instance!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(baseURL url: NSURL!, sessionConfiguration configuration: NSURLSessionConfiguration!) {
        super.init(baseURL: url, sessionConfiguration: configuration)
    }
    
    // Set access tokens and access secret.
    
    init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
        self.accessToken = accessToken
        self.accessSecret = accessSecret
        let baseUrl = NSURL(string: "https://api.yelp.com/v2/")
        
        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret)
        
        let token = BDBOAuth1Credential(token: accessToken, secret: accessSecret, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    
    func searchWithTerm(term: String, completion: ([Business]!, NSError!) -> Void) -> NSURLSessionTask {
        return searchWithTerm(term, sort: nil, categories: nil, deals: nil, radius_filter: nil, completion: completion)
    }
    
    func searchWithTerm(term: String, sort: YelpSortMode?, categories: [String]?, deals: Bool?, radius_filter: Int?, completion: ([Business]!, NSError!) -> Void) -> NSURLSessionTask {
        // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
        
        // Set coordinates from user location to get nearest resturants and activities.
      
        latitude = coordDefaults.doubleForKey("latitude")
        
        if latitude == nil || latitude == 0.0 {
            //latitude = "38.785771"
            latitude = 33.4240552
        }
       
        longitude = coordDefaults.doubleForKey("longitude")
        
        
        if longitude == nil || longitude == 0.0 {
            //longitude = "-122.406165"
            longitude = -111.9408284
        }
        
        print("YELPCLIENT LATITUDE")
        print("\(latitude)")
        print("YELPCLIENT LONGITUDE")
        print("\(longitude)")
        
        
        
        // Default the location to San Francisco
        var parameters: [String : AnyObject] = ["term": term, "ll": "\(latitude),\(longitude)"]
        
        if sort != nil {
            parameters["sort"] = sort!.rawValue
        }
        
        if categories != nil && categories!.count > 0 {
            parameters["category_filter"] = (categories!).joinWithSeparator(",")
        }
        
        if deals != nil {
            parameters["deals_filter"] = deals!
        }
        if radius_filter != nil {
            parameters["radius_filter"] = radius_filter!
        }
        
        print(parameters)
        
        return self.GET("search", parameters: parameters, success: { (operation: NSURLSessionDataTask!, response: AnyObject?) -> Void in
            let dictionaries = response!["businesses"] as? [NSDictionary]
            if dictionaries != nil {
                completion(Business.businesses(array: dictionaries!), nil)
            }
            }, failure: { (operation: NSURLSessionTask?, error: NSError!) -> Void in
                completion(nil, error)
        })!

        
        
    }
    
    
    // Added the offset feature with searchWithTerm
    
    func searchWithTermOffset(term: String, offset:Int, sort: YelpSortMode?, categories: [String]?, deals: Bool?, completion: ([Business]!, NSError!) -> Void) -> NSURLSessionTask {
        // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
        
        
        
        // Default the location to Arizona State University if GPS coordinates wasn't collected.
        var parameters: [String : AnyObject] = ["term": term, "ll": "37.785771,-122.406165"]
        
        parameters["offset"] = offset
        
        if sort != nil {
            parameters["sort"] = sort!.rawValue
        }
        
        if categories != nil && categories!.count > 0 {
            parameters["category_filter"] = (categories!).joinWithSeparator(",")
        }
        
        if deals != nil {
            parameters["deals_filter"] = deals!
        }
        
        print(parameters)
        
        return self.GET("search", parameters: parameters, success: { (operation: NSURLSessionDataTask!, response: AnyObject?) -> Void in
            let dictionaries = response!["businesses"] as? [NSDictionary]
            if dictionaries != nil {
                completion(Business.businesses(array: dictionaries!), nil)
            }
            }, failure: { (operation: NSURLSessionDataTask?, error: NSError!) -> Void in
                completion(nil, error)
        })!
    }
    

}

