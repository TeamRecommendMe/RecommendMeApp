//
//  AdvancedFilterViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 3/28/16.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        self.advTableView.backgroundColor = UIColor.clearColor();
        navigationItem.title = "Advance Filter"
        let btnBack = self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "btnCancelPressed:")
        
        let btnSearch = self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .Plain, target: self, action: "btnSearchPressed:")
        
            
        foodCategories = AdvYelpCategories()
        activitiesCategories = AdvBigActivities()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
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
            // section 0 is foods and there is 168 of them
        case 0:

            return 169
            
            // section 1 is big activities and there is 11 of them.
        case 1:
           
            return 11
        default:
            return 0
            
        }

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("advCell", forIndexPath: indexPath) as! advDataCell
        cell.backgroundColor = UIColor.clearColor()
        cell.advDelegate = self
        
        switch(indexPath.section) {
        case 0:
            cell.lblCategoryItem.text = foodCategories[indexPath.row]["name"]

            
        case 1:
            cell.lblCategoryItem.text = activitiesCategories[indexPath.row]["name"]
            

        default:
            cell.advOnOffSwitch.on = false
            return cell
        }
        
        if advSwitchStates[indexPath] != nil {
            
            
            cell.advOnOffSwitch.on = advSwitchStates[indexPath]!
        }
        else {
            cell.advOnOffSwitch.on = false
        }
        cell.advOnOffSwitch.on = advSwitchStates[indexPath] ?? false
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let advHeaderCell = tableView.dequeueReusableCellWithIdentifier("advancedHeaderCell") as! AdvancedHeaderCellTableViewCell
        advHeaderCell.backgroundColor = UIColor.grayColor()
        
        advHeaderCell.advHeaderLabel.font = UIFont(name: "Verdana-BoldItalic", size: 17)!
        advHeaderCell.advHeaderLabel.textColor = UIColor.whiteColor()
        
        let activitiesImage = UIImage(named: "activitiesButton")
        let restaurantsImage = UIImage(named: "restaurantsButton")
        
        switch(section) {
        case 0:
            print("Section Label for \(section)")
            advHeaderCell.advHeaderLabel.text = "Food Types";
            advHeaderCell.headerImage.image = restaurantsImage
        case 1:
            advHeaderCell.advHeaderLabel.text = "Activity Types";
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
        
        print("This advanced filter controller has received the switch event.")
        advSwitchStates[indexPath] = value
        
    }
    
    
    
    func btnSearchPressed(sender: UIBarButtonItem) {
        print("Search button is pressed")
        
        var selectedCategories = [[String: String]]()
        //var advfilters = [String: AnyObject]()
        var testName: String
        var testCode: String
        
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
                
               // selectedCategories.append(["name" : testName, "code": testCode])
                
                print("There is a total of \(selectedCategories.count) items in selected categories.")
                
                print("Printing items appended in selected Categories")
                
                // Not the best way to display the array of dictionaries but it works.
                
                for item in selectedCategories {
                    
                    for(key, value) in item {
                        print("\(key): \(value)")
                    }
                }
                
            }
            else{
                print("failed to select anything")
            }
        }
        
        print("Search button is pressed func is complete!")
        
        
    }
    

    
    func btnCancelPressed(sender: UIBarButtonItem) {
        
        print("Button is Pressed")
       
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func AdvYelpCategories() -> [[String:String]] {
        return [["name" : "Afghan", "code": "afghani"],
            ["name" : "African", "code": "african"],
            ["name" : "American, New", "code": "newamerican"],
            ["name" : "American, Traditional", "code": "tradamerican"],
            ["name" : "Arabian", "code": "arabian"],
            ["name" : "Argentine", "code": "argentine"],
            ["name" : "Armenian", "code": "armenian"],
            ["name" : "Asian Fusion", "code": "asianfusion"],
            ["name" : "Asturian", "code": "asturian"],
            ["name" : "Australian", "code": "australian"],
            ["name" : "Austrian", "code": "austrian"],
            ["name" : "Baguettes", "code": "baguettes"],
            ["name" : "Bangladeshi", "code": "bangladeshi"],
            ["name" : "Barbeque", "code": "bbq"],
            ["name" : "Basque", "code": "basque"],
            ["name" : "Bavarian", "code": "bavarian"],
            ["name" : "Beer Garden", "code": "beergarden"],
            ["name" : "Beer Hall", "code": "beerhall"],
            ["name" : "Beisl", "code": "beisl"],
            ["name" : "Belgian", "code": "belgian"],
            ["name" : "Bistros", "code": "bistros"],
            ["name" : "Black Sea", "code": "blacksea"],
            ["name" : "Brasseries", "code": "brasseries"],
            ["name" : "Brazilian", "code": "brazilian"],
            ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
            ["name" : "British", "code": "british"],
            ["name" : "Buffets", "code": "buffets"],
            ["name" : "Bulgarian", "code": "bulgarian"],
            ["name" : "Burgers", "code": "burgers"],
            ["name" : "Burmese", "code": "burmese"],
            ["name" : "Cafes", "code": "cafes"],
            ["name" : "Cafeteria", "code": "cafeteria"],
            ["name" : "Cajun/Creole", "code": "cajun"],
            ["name" : "Cambodian", "code": "cambodian"],
            ["name" : "Canadian", "code": "New)"],
            ["name" : "Canteen", "code": "canteen"],
            ["name" : "Caribbean", "code": "caribbean"],
            ["name" : "Catalan", "code": "catalan"],
            ["name" : "Chech", "code": "chech"],
            ["name" : "Cheesesteaks", "code": "cheesesteaks"],
            ["name" : "Chicken Shop", "code": "chickenshop"],
            ["name" : "Chicken Wings", "code": "chicken_wings"],
            ["name" : "Chilean", "code": "chilean"],
            ["name" : "Chinese", "code": "chinese"],
            ["name" : "Comfort Food", "code": "comfortfood"],
            ["name" : "Corsican", "code": "corsican"],
            ["name" : "Creperies", "code": "creperies"],
            ["name" : "Cuban", "code": "cuban"],
            ["name" : "Curry Sausage", "code": "currysausage"],
            ["name" : "Cypriot", "code": "cypriot"],
            ["name" : "Czech", "code": "czech"],
            ["name" : "Czech/Slovakian", "code": "czechslovakian"],
            ["name" : "Danish", "code": "danish"],
            ["name" : "Delis", "code": "delis"],
            ["name" : "Diners", "code": "diners"],
            ["name" : "Dumplings", "code": "dumplings"],
            ["name" : "Eastern European", "code": "eastern_european"],
            ["name" : "Ethiopian", "code": "ethiopian"],
            ["name" : "Fast Food", "code": "hotdogs"],
            ["name" : "Filipino", "code": "filipino"],
            ["name" : "Fish & Chips", "code": "fishnchips"],
            ["name" : "Fondue", "code": "fondue"],
            ["name" : "Food Court", "code": "food_court"],
            ["name" : "Food Stands", "code": "foodstands"],
            ["name" : "French", "code": "french"],
            ["name" : "French Southwest", "code": "sud_ouest"],
            ["name" : "Galician", "code": "galician"],
            ["name" : "Gastropubs", "code": "gastropubs"],
            ["name" : "Georgian", "code": "georgian"],
            ["name" : "German", "code": "german"],
            ["name" : "Giblets", "code": "giblets"],
            ["name" : "Gluten-Free", "code": "gluten_free"],
            ["name" : "Greek", "code": "greek"],
            ["name" : "Halal", "code": "halal"],
            ["name" : "Hawaiian", "code": "hawaiian"],
            ["name" : "Heuriger", "code": "heuriger"],
            ["name" : "Himalayan/Nepalese", "code": "himalayan"],
            ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
            ["name" : "Hot Dogs", "code": "hotdog"],
            ["name" : "Hot Pot", "code": "hotpot"],
            ["name" : "Hungarian", "code": "hungarian"],
            ["name" : "Iberian", "code": "iberian"],
            ["name" : "Indian", "code": "indpak"],
            ["name" : "Indonesian", "code": "indonesian"],
            ["name" : "International", "code": "international"],
            ["name" : "Irish", "code": "irish"],
            ["name" : "Island Pub", "code": "island_pub"],
            ["name" : "Israeli", "code": "israeli"],
            ["name" : "Italian", "code": "italian"],
            ["name" : "Japanese", "code": "japanese"],
            ["name" : "Jewish", "code": "jewish"],
            ["name" : "Kebab", "code": "kebab"],
            ["name" : "Korean", "code": "korean"],
            ["name" : "Kosher", "code": "kosher"],
            ["name" : "Kurdish", "code": "kurdish"],
            ["name" : "Laos", "code": "laos"],
            ["name" : "Laotian", "code": "laotian"],
            ["name" : "Latin American", "code": "latin"],
            ["name" : "Live/Raw Food", "code": "raw_food"],
            ["name" : "Lyonnais", "code": "lyonnais"],
            ["name" : "Malaysian", "code": "malaysian"],
            ["name" : "Meatballs", "code": "meatballs"],
            ["name" : "Mediterranean", "code": "mediterranean"],
            ["name" : "Mexican", "code": "mexican"],
            ["name" : "Middle Eastern", "code": "mideastern"],
            ["name" : "Milk Bars", "code": "milkbars"],
            ["name" : "Modern Australian", "code": "modern_australian"],
            ["name" : "Modern European", "code": "modern_european"],
            ["name" : "Mongolian", "code": "mongolian"],
            ["name" : "Moroccan", "code": "moroccan"],
            ["name" : "New Zealand", "code": "newzealand"],
            ["name" : "Night Food", "code": "nightfood"],
            ["name" : "Norcinerie", "code": "norcinerie"],
            ["name" : "Open Sandwiches", "code": "opensandwiches"],
            ["name" : "Oriental", "code": "oriental"],
            ["name" : "Pakistani", "code": "pakistani"],
            ["name" : "Parent Cafes", "code": "eltern_cafes"],
            ["name" : "Parma", "code": "parma"],
            ["name" : "Persian/Iranian", "code": "persian"],
            ["name" : "Peruvian", "code": "peruvian"],
            ["name" : "Pita", "code": "pita"],
            ["name" : "Pizza", "code": "pizza"],
            ["name" : "Polish", "code": "polish"],
            ["name" : "Portuguese", "code": "portuguese"],
            ["name" : "Potatoes", "code": "potatoes"],
            ["name" : "Poutineries", "code": "poutineries"],
            ["name" : "Pub Food", "code": "pubfood"],
            ["name" : "Rice", "code": "riceshop"],
            ["name" : "Romanian", "code": "romanian"],
            ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
            ["name" : "Rumanian", "code": "rumanian"],
            ["name" : "Russian", "code": "russian"],
            ["name" : "Salad", "code": "salad"],
            ["name" : "Sandwiches", "code": "sandwiches"],
            ["name" : "Scandinavian", "code": "scandinavian"],
            ["name" : "Scottish", "code": "scottish"],
            ["name" : "Seafood", "code": "seafood"],
            ["name" : "Serbo Croatian", "code": "serbocroatian"],
            ["name" : "Signature Cuisine", "code": "signature_cuisine"],
            ["name" : "Singaporean", "code": "singaporean"],
            ["name" : "Slovakian", "code": "slovakian"],
            ["name" : "Soul Food", "code": "soulfood"],
            ["name" : "Soup", "code": "soup"],
            ["name" : "Southern", "code": "southern"],
            ["name" : "Spanish", "code": "spanish"],
            ["name" : "Steakhouses", "code": "steak"],
            ["name" : "Sushi Bars", "code": "sushi"],
            ["name" : "Swabian", "code": "swabian"],
            ["name" : "Swedish", "code": "swedish"],
            ["name" : "Swiss Food", "code": "swissfood"],
            ["name" : "Tabernas", "code": "tabernas"],
            ["name" : "Taiwanese", "code": "taiwanese"],
            ["name" : "Tapas Bars", "code": "tapas"],
            ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
            ["name" : "Tex-Mex", "code": "tex-mex"],
            ["name" : "Thai", "code": "thai"],
            ["name" : "Traditional Norwegian", "code": "norwegian"],
            ["name" : "Traditional Swedish", "code": "traditional_swedish"],
            ["name" : "Trattorie", "code": "trattorie"],
            ["name" : "Turkish", "code": "turkish"],
            ["name" : "Ukrainian", "code": "ukrainian"],
            ["name" : "Uzbek", "code": "uzbek"],
            ["name" : "Vegan", "code": "vegan"],
            ["name" : "Vegetarian", "code": "vegetarian"],
            ["name" : "Venison", "code": "venison"],
            ["name" : "Vietnamese", "code": "vietnamese"],
            ["name" : "Wok", "code": "wok"],
            ["name" : "Wraps", "code": "wraps"],
            ["name" : "Yugoslav", "code": "yugoslav"]]
    }
    
    
    func AdvBigActivities() -> [[String:String]]
    {
        return [["name" : "Attractions", "code": "attract"],
            ["name" : "Beauty and Spas", "code": "beautyNSpas"],
            ["name" : "Entertainment", "code": "Ent"],
            ["name" : "Great Outdoors/Extreme", "code": "GOE"],
            ["name" : "Landmarks/Historical Buildings", "code": "landmarks"],
            ["name" : "Nightlife", "code": "night"],
            ["name" : "Parks", "code": "parks"],
            ["name" : "Pets", "code": "pets"],
            ["name" : "Professional Sporting Events", "code": "pro"],
            ["name" : "Sports", "code": "sports"],
            ["name" : "Water", "code": "water"]]
    }
    
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
