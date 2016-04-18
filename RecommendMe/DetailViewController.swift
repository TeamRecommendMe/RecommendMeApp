//
//  DetailViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 4/6/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblBusinessName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSnippet: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    var business: Business!
    var mobileURL: String!
    var ratingNum: Double!
    var mapURL: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var address = ""
        
        lblBusinessName.text = business.name
        lblAddress.text = business.address
        imgProfile.setImageWithURL(business.imageURL!)
        lblSnippet.text = business.snippet
        lblPhoneNumber.text = business.phone
        ratingNum = business.rating
        address = lblAddress.text!
        
        lblRating.text = "\(ratingNum) out of 5"
        mobileURL = business.bizURL
        
        let replacedAddress = address.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        mapURL = "http://maps.apple.com/?daddr=\(replacedAddress)&dirflg=d&t=h"
        
        
        
        print("Detail View Controller Data")
      print("\(business.name)")
      print("\(business.address)")
        
        print(business.latitude)
        print(business.longitude)
        
        print(mapURL)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func openBizURL(sender: AnyObject) {
        if let targetURL = NSURL(string: mobileURL){
           UIApplication.sharedApplication().openURL(targetURL)
        }
        
        
        
    }
    
    @IBAction func btnGoogleMaps(sender: AnyObject) {
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func navTest(sender: AnyObject) {
        print("navTest button pressed")
        if let test = NSURL(string: mapURL) {
            UIApplication.sharedApplication().openURL(test)
        }
    }
    
    
    @IBAction func callTest(sender: AnyObject) {
        
        let callNum = "1-\(business.phone!)"
        print(callNum)
        
        
        if let callPhoneNum = NSURL(string: "tel://\(callNum)") {
            UIApplication.sharedApplication().openURL(callPhoneNum)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
