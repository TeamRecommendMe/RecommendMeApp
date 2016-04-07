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
    var business: Business!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblBusinessName.text = business.name
        lblAddress.text = business.address
        imgProfile.setImageWithURL(business.imageURL!)
        
        
        print("Detail View Controller Data")
        print("\(business.name)")
        print("\(business.address)")
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnGoogleMaps(sender: AnyObject) {
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
