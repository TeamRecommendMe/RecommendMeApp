//
//  ResultsTableViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 4/4/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit
import GameplayKit


class ResultsTableViewController: UITableViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    

    var businesses: [Business]!
    var segueBusiness: Business!
    var segueName: String!
    var segueAddress: String!
    var finishedShuffledCategories = [String]()
    var readyToShuffleCategories = [String]()
    var randomizer = 1 // 0 for restaurants and 1 for activities
    
    var sectionTwoData: [Business]!
    var sectionThreeData: [Business]!
    var sectionFourData: [Business]!
    var sectionFiveData: [Business]!
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
   // selectedActivities
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.estimatedRowHeight = 220
        tableView.rowHeight = 240
        
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
       
        
        // Shuffle the categories and begin creating table.
       finishedShuffledCategories = shuffleCategories(readyToShuffleCategories)
        
        for categories in finishedShuffledCategories {
            print(categories)
        }
        
        
       
        Business.searchWithTerm(finishedShuffledCategories[0], completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        
        
        Business.searchWithTerm(finishedShuffledCategories[1], completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.sectionTwoData = businesses
            
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        
        
        Business.searchWithTerm(finishedShuffledCategories[2], completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.sectionThreeData = businesses
            
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        
        
        
        Business.searchWithTerm(finishedShuffledCategories[3], completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.sectionFourData = businesses
            
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        
        
        
        Business.searchWithTerm(finishedShuffledCategories[4], completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.sectionFiveData = businesses
            self.tableView.reloadData()
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        
        self.tableView.reloadData()
            
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
        if businesses != nil {
            return 4
        }
        else {
        
            return 0
        }
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsDataCell", forIndexPath: indexPath) as! ResultsDataCell
        
        switch(indexPath.section) {
        case 0:
            cell.business = businesses[indexPath.row]
        case 1:
            cell.business = sectionTwoData[indexPath.row]
        case 2:
            cell.business = sectionThreeData[indexPath.row]
        case 3:
            cell.business = sectionFourData[indexPath.row]
        default:
            cell.business = sectionFiveData[indexPath.row]
            
        }
        
        
        return cell
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
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let business = businesses![indexPath!.row]
            
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.business = business
           
        }
        
    }
    
    
    /*
    
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        let categories = filters["categories"] as? [String]
        
        
        Business.searchWithTerm("Restaurants", sort: nil, categories: categories, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }    }
*/
}
