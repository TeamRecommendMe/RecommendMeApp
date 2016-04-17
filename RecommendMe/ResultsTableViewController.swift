//
//  ResultsTableViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 4/4/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit
import GameplayKit
import MBProgressHUD

class ResultsTableViewController: UITableViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    
    var businesses: [Business] = []
    var segueBusiness: Business!
    var segueName: String!
    var segueAddress: String!
    var finishedShuffledCategories = [String]()
    var readyToShuffleCategories = [String]()
    var randomizer = 1 // 0 for restaurants and 1 for activities
    
    var sectionTwoData: [Business] = []
    var sectionThreeData: [Business] = []
    var sectionFourData: [Business] = []
    var sectionFiveData: [Business] = []
    
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 250
        
        let loadingBar = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        loadingBar.mode = MBProgressHUDMode.DeterminateHorizontalBar
        loadingBar.labelFont = UIFont(name: "Verdana-BoldItalic", size: 15)
        loadingBar.labelText = "Loading"
        
        
        switch(randomizer) {
        case 0:
            let selectedFoodCategories = userDefaults.objectForKey("selectedFoods") as? [[String: String]] ?? [[String: String]]()
            
            for item in selectedFoodCategories {
                for (key, value) in item {
                    if(key != "code")
                    {
                        print(key,value)
                        readyToShuffleCategories.append(value)
                    }
                    
                }
            }
            
        default:
            let selectedActivityCategories = userDefaults.objectForKey("selectedActivities") as? [[String: String]] ?? [[String: String]]()
            
            for item in selectedActivityCategories {
                for (key, value) in item {
                    
                    if(key != "code") {
                        readyToShuffleCategories.append(value)
                        
                    }
                }
            }
        }
        
        loadingBar.progress = 0.15
        
        
        // Shuffle the categories and begin creating table.
        finishedShuffledCategories = shuffleCategories(readyToShuffleCategories)
        
        for categories in finishedShuffledCategories {
            print(categories)
        }
        
        loadingBar.progress = 0.25
        
        Business.searchWithTerm(finishedShuffledCategories[0], completion: { (businesses: [Business]!, error: NSError!) -> Void in
            
                if (businesses?.isEmpty != nil) {
            
                self.businesses = businesses
            
            
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
                    
                    
            }
            
            loadingBar.progress = 0.4
            
            Business.searchWithTerm(self.finishedShuffledCategories[1], completion: { (businesses: [Business]!, error: NSError!) -> Void in
                
                if(businesses?.isEmpty != nil){
                    self.sectionTwoData = businesses
                
                
                    for business in businesses {
                        print(business.name!)
                        print(business.address!)
                    }
                }
                
                Business.searchWithTerm(self.finishedShuffledCategories[2], completion: { (businesses: [Business]!, error: NSError!) -> Void in
                    
                    if(businesses?.isEmpty != nil){
                    
                        self.sectionThreeData = businesses
                    
                    
                        for business in businesses {
                            print(business.name!)
                            print(business.address!)
                        }
                    
                    }
                    loadingBar.progress = 0.6
                    
                    Business.searchWithTerm(self.finishedShuffledCategories[3], completion: { (businesses: [Business]!, error: NSError!) -> Void in
                        
                        if(businesses?.isEmpty != nil) {
                        
                            self.sectionFourData = businesses
                        
                        
                            for business in businesses {
                                print(business.name!)
                                print(business.address!)
                            }
                        }
                        
                        Business.searchWithTerm(self.finishedShuffledCategories[4], completion: { (businesses: [Business]!, error: NSError!) -> Void in
                            
                            if(businesses?.isEmpty != nil) {
                            
                                self.sectionFiveData = businesses
                                self.tableView.reloadData()
                                for business in businesses {
                                    print(business.name!)
                                    print(business.address!)
                                }
                                
                            }
                            
                            loadingBar.progress = 1.0
                            
                        })
                        
                    })
                })
                
            })
            
        })
        
        
       loadingBar.hide(true,afterDelay: 4)
        /* Example of Yelp search with more search options specified
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
        self.businesses = businesses
        
        for business in businesses {
        print(business.name!)
        print(business.address!)
        }
        }
        */
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let resultsSectionCell = tableView.dequeueReusableCellWithIdentifier("resultsHeader") as! ResultsHeaderCell
        
        resultsSectionCell.backgroundColor = UIColor.grayColor()
        resultsSectionCell.lblHeaderTitle.font = UIFont(name: "Verdana-BoldItalic", size: 17)!
        resultsSectionCell.lblHeaderTitle.textColor = UIColor.whiteColor()
        resultsSectionCell.selectionStyle = .None
        
        
        switch(section) {
        case 0:
            resultsSectionCell.lblHeaderTitle.text = finishedShuffledCategories[0]
        case 1:
            resultsSectionCell.lblHeaderTitle.text = finishedShuffledCategories[1]
        case 2:
            resultsSectionCell.lblHeaderTitle.text = finishedShuffledCategories[2]
        case 3:
            resultsSectionCell.lblHeaderTitle.text = finishedShuffledCategories[3]
        default:
            resultsSectionCell.lblHeaderTitle.text = finishedShuffledCategories[4]
        }
        return resultsSectionCell
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (!businesses.isEmpty) {
        
            switch(section){
            case 0:
                if (businesses.count < 4 && !businesses.isEmpty) {
                    return businesses.count
                }
                else if (businesses.isEmpty) {
                    return 0
                }
                else {
                    return 4
                }
            case 1:
                if(sectionTwoData.count < 4 && !sectionTwoData.isEmpty) {
                    return sectionTwoData.count
                }
                else if(sectionTwoData.isEmpty)
                {
                    return 0
                }
                    
                else {
                    return 4
                }
            case 2:
                if (sectionThreeData.count < 4 && !sectionThreeData.isEmpty) {
                    return sectionThreeData.count
                }
                else if(sectionThreeData.isEmpty) {
                    return 0
                }
                else {
                    return 4
                }
            case 3:
                if (sectionFourData.count < 4 && !sectionFourData.isEmpty) {
                    return sectionFourData.count
                }
                else if(sectionFourData.isEmpty) {
                    return 0
                }
                    
                else {
                    return 4
                }
            default:
                
                if (sectionFiveData.count < 4 && !sectionFiveData.isEmpty) {
                    return sectionFiveData.count
                }
                else if(sectionFiveData.isEmpty){
                    return 0
                }
                    
                else {
                    return 4
                }
            }
        
        }
        
        else {
            return 0
        }
        
        
        
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsDataCell", forIndexPath: indexPath) as! ResultsDataCell
        
        
        
        
        switch(indexPath.section) {
        case 0:
            if (!businesses.isEmpty) {
                cell.business = businesses[indexPath.row]
            }
            
        case 1:
            if(!sectionTwoData.isEmpty){
                cell.business = sectionTwoData[indexPath.row]
            }
            
        case 2:
            if(!sectionThreeData.isEmpty) {
                cell.business = sectionThreeData[indexPath.row]
            }
            
            
        case 3:
            if(!sectionFourData.isEmpty) {
                cell.business = sectionFourData[indexPath.row]
            }
            
        default:
            if(!sectionFiveData.isEmpty) {
                cell.business = sectionFiveData[indexPath.row]
            }
            
        }
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = .clearColor()
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func shuffleCategories(categories: [String]) -> [String] {
        
        var shuffled = []
        var name: String
        var firstFiveCategories = [String]()
        //        var tempCategories: [String]
        
        shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(categories)
        
        for item in shuffled
        {
            print("\(item)")
            
            name = item as! String
            
            firstFiveCategories.append(name)
            
            if(firstFiveCategories.count > 5)
            {
                break
            }
        }
        
        for item in firstFiveCategories {
            print("\(item)")
        }
        
        return firstFiveCategories
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "details" {
            
            let sectionArray = [businesses,sectionTwoData, sectionThreeData, sectionFourData, sectionFiveData]
            
            let detailViewController = segue.destinationViewController as! DetailViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                detailViewController.business = sectionArray[indexPath.section][indexPath.row]
            }
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let backgroundImage = UIImage(named: "background.png")
        
        let imageView = UIImageView(image: backgroundImage)
        
        imageView.contentMode = .ScaleAspectFill
        
        self.tableView.backgroundView = imageView
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
}