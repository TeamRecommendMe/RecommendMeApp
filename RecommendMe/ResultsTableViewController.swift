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
    var businessesSectionTwo: [Business]!
    var finishedShuffledCategories = [String]()
    var readyToShuffleCategories = [String]()
    var randomizer = 0 // 0 for restaurants and 1 for activities
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
   // selectedActivities
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.estimatedRowHeight = 220
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        switch(randomizer) {
        case 0:
            let selectedFoodCategories = userDefaults.objectForKey("TempUserSelected") as? [[String: String]] ?? [[String: String]]()
            
            for item in selectedFoodCategories {
                for (key, value) in item {
                    if(key != "code")
                    {
                        print(key,value)
                    }
                    readyToShuffleCategories.append(value)
                }
            }
        default:
            let selectedActivityCategories = userDefaults.objectForKey("selectedActivities") as? [[String: String]] ?? [[String: String]]()
            
            for item in selectedActivityCategories {
                for (key, value) in item {
                    print("\(key)")
                    readyToShuffleCategories.append(key)
                }
            }
        }
       
        
        // Shuffle the categories and begin creating table.
       finishedShuffledCategories = shuffleCategories(readyToShuffleCategories)
        
        for categories in finishedShuffledCategories {
            print(categories)
        }
        
        
       
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        Business.searchWithTerm("Italian", completion: { (businesses: [Business]!, error: NSError!) -> Void in
                self.businessesSectionTwo = businesses
                self.tableView.reloadData()
            
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            })
        
        
            
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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let resultsSectionCell = tableView.dequeueReusableCellWithIdentifier("resultsHeader") as! ResultsHeaderCell
        switch(section) {
        case 0:
            resultsSectionCell.lblHeaderTitle.text = "Thai Foods"
        default:
            resultsSectionCell.lblHeaderTitle.text = "Italian Foods"
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
        default:
            cell.business = businessesSectionTwo[indexPath.row]
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
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Filters" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let filtersViewController = navigationController.topViewController as! FiltersViewController
            filtersViewController.delegate = self
        }
        else if segue.identifier == "Details" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let business = businesses![indexPath!.row]
            
            let detailViewController = segue.destinationViewController as! DetailsViewController
            detailViewController.business = business
            
        }
        
    }
    
    
    
    */
    
    
    
    /*
    
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        let categories = filters["categories"] as? [String]
        
        
        Business.searchWithTerm("Restaurants", sort: nil, categories: categories, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }    }
*/
}
