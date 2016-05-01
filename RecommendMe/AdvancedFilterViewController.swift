//
//  AdvancedFilterViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken and Ryan Linehan on 3/28/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit

@objc protocol AdvFiltersViewControllerDelegate {
    optional func advancedfiltersViewController(AdvancedFilterViewController: AdvancedFilterViewController, didUpdateFilters advfilters: [String: AnyObject])
}


class AdvancedFilterViewController: UITableViewController, AdvSwitchCellDelegate {

    
    @IBOutlet var advTableView: UITableView!
    
    var foodCategories: [[String: String]]!
    var activitiesCategories: [[String: String]]!
    var advSwitchStates = [NSIndexPath: Bool]()
    
    let advDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background")) //sets background image
        self.advTableView.backgroundColor = UIColor.clearColor();
        navigationItem.title = "Advance Search" // sets title of navigation bar
        _ = self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(AdvancedFilterViewController.btnCancelPressed(_:))) //sets back button
        _ = self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .Plain, target: self, action: #selector(AdvancedFilterViewController.btnSearchPressed(_:))) //sets search button
        
        foodCategories = RestruantsList.allFoodCategories() //sets food categories to list inside ResturantsList
        activitiesCategories = ActivitiesList.bigActivities() //sets activitiesCategories to list inside ActivitiesList
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 2 // Food section and Big Activities.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        switch (section) {
        case 0:

            return foodCategories.count //returns number of cells needed in Foods section
            
        case 1:
           
            return activitiesCategories.count //returns number of cells needed in Activities section
        default:
            return 0
            
        }

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("advCell", forIndexPath: indexPath) as! advDataCell
        cell.backgroundColor = UIColor.clearColor() //sets background color of tableview to clear
        cell.advDelegate = self
        cell.selectionStyle = .None //sets selection style to none

        
        switch(indexPath.section) {
        case 0:
            cell.lblCategoryItem.text = foodCategories[indexPath.row]["name"] //Sets cell text to name of each food category inside the foods header

            
        case 1:
            cell.lblCategoryItem.text = activitiesCategories[indexPath.row]["name"] //Sets cell text to name of each activity inside the activities header
            

        default:
            cell.advOnOffSwitch.on = false
            return cell
        }
        
        if advSwitchStates[indexPath] != nil { //sets the switches all to off inside the table view
            cell.advOnOffSwitch.on = advSwitchStates[indexPath]!
        }
        else {
            cell.advOnOffSwitch.on = false
        }
        cell.advOnOffSwitch.on = advSwitchStates[indexPath] ?? false
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65.0 //returns height of the header section
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let advHeaderCell = tableView.dequeueReusableCellWithIdentifier("advancedHeaderCell") as! AdvancedHeaderCellTableViewCell
        advHeaderCell.backgroundColor = UIColor.grayColor() //sets header background to gray color
        
        advHeaderCell.advHeaderLabel.font = UIFont(name: "Verdana-BoldItalic", size: 25)! //sets font
        advHeaderCell.advHeaderLabel.textColor = UIColor.whiteColor()//sets color of text
        
        let activitiesImage = UIImage(named: "activitiesButton") //sets image inside activites header
        let restaurantsImage = UIImage(named: "restaurantsButton")//sets image inside foods header
        
        switch(section) {
        case 0:
            advHeaderCell.advHeaderLabel.text = "Foods"; //sets header label to "Foods"
            advHeaderCell.headerImage.image = restaurantsImage
        case 1:
            advHeaderCell.advHeaderLabel.text = "Activities"; //sets header label to "Activities"
            advHeaderCell.headerImage.image = activitiesImage
        default:
            advHeaderCell.advHeaderLabel.text = "Others";
        }
        
        return advHeaderCell
    }
    
    
    func switchCell(advSwitchCell: advDataCell,didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(advSwitchCell)!
        let numIndex = indexPath.section
        print (indexPath)
        print (numIndex)
        advSwitchStates[indexPath] = value
        
    }
    
    
    
    func btnSearchPressed(sender: UIBarButtonItem) {
        
        var selectedCategories = [[String: String]]()
        var testName: String
        var testCode: String
        
        testCode = ""
        testName = ""
        
        for (NSIndexPath, isSelected) in advSwitchStates {
            if isSelected {
                
                if(NSIndexPath.section == 0){
                    testName = foodCategories[NSIndexPath.row]["name"]!
                    testCode = foodCategories[NSIndexPath.row]["code"]!
                    print("\(testName) \(testCode) was selected")
                }
                else if(NSIndexPath.section == 1){
                    testName = activitiesCategories[NSIndexPath.row]["name"]!
                    testCode = activitiesCategories[NSIndexPath.row]["code"]!
                    print("\(testName) \(testCode) was selected")
                }
                
                                print("Adding values into the array of dictionaries")
                
                selectedCategories.append(["name" : testName, "code": testCode])
                
                
            }
            else{
                print("failed to select anything")
            }
        }
        
        
        
        
        // Test if user picks 5 categories minimum.
        let alertTitle = "Less than 5"
        let message = "Choose 5 or more categories to start the search."
        
        if selectedCategories.count < 5 {
            let checkCategoryAlert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            checkCategoryAlert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(checkCategoryAlert, animated: true, completion: nil)
        }
        else {
            advDefaults.setObject(selectedCategories, forKey: "advanceDefaults")
            performSegueWithIdentifier("advanceToResults", sender: self)
            print("Search button is pressed func is complete! Advanced Filter")        }
        
    }
    
    func btnCancelPressed(sender: UIBarButtonItem) {
        
        print("Button is Pressed")
       
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "advanceToResults") {
            let resultVC = segue.destinationViewController as! ResultsTableViewController
            resultVC.randomizer = 2
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
