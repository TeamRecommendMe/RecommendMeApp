//
//  InitialSettingsViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken and Ryan Linehan on 3/23/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//



// If you are going to follow a tutorial, please follow it to the end. You're missing a lot of the settings required in
// The http://www.ioscreator.com/tutorials/customizing-header-footer-table-view-ios8-swift tutorial for what you are doing. 
// 
//
// Please also see the other comments below and fix your changes. It's Easter so I'm not going to be around to help you.
// Push your work as you go so I can see changes. That's when I have time of course.
// 
//
// FILTERS VIDEO SEE: 
// https://www.youtube.com/watch?v=sgqlFm8vdwo&list=PLrT2tZ9JRrf7p1AoQ0C7APLImJjdUiEbA&index=3https://gist.github.com/timothy1ee/e23415fa468c76e84fb3



import UIKit

@ objc protocol InitialSettingsViewControllerDelegate {
    optional func initialSettingsViewController (initialSettingsViewController: InitialSettingsViewController, didUpdateFilters filters: [String:AnyObject])
}

class InitialSettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellTableViewCellDelegate {


    @IBOutlet weak var tableView: UITableView!
    weak var delegate: InitialSettingsViewControllerDelegate?
    var foodCategories: [[String:String]]!
    var activitiesCategories:[[String:String]]!
    var  bigActivitiesCategories :[[String:String]]!
    var switchStates = [NSIndexPath: Bool]()
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var selectedFoodCats: [[String:String]]!
    var selectedActivitiesCats: [[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        foodCategories = RestruantsList.customCategories() //Creates an array of all the customCategories in ResturantsList
        bigActivitiesCategories = ActivitiesList.bigActivities()//Creates an array of all the bigActivities in ActivitiesList
        self.tableView.backgroundColor = UIColor.clearColor(); //sets the background of the tableView to be clear
        if (userDefaults.boolForKey("userExists") == false) //Checks if the user has opened the app begore
        {
            //On the next 4 lines since the user is new it adds all the categories from the start. And saves these into NSUserDefaults
            selectedFoodCats = RestruantsList.customCategories()
            selectedActivitiesCats = ActivitiesList.bigActivities()
            userDefaults.setObject(selectedFoodCats, forKey: "selectedFoodCats")
            userDefaults.setObject(selectedActivitiesCats, forKey: "selectedActivitiesCats")
        }
        else //Since the user isn't new we allow them to swipe back to the MainMenuViewController
        {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(InitialSettingsViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        }
        //userDefaults.setBool(false, forKey: "changedPreferences")
        userDefaults.setBool(true, forKey: "userExists") //Tells NSUserDefaults that the user exists
        _ = self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(InitialSettingsViewController.doneButton(_:)))
        _ = self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Skip", style: .Plain, target: self, action: #selector(InitialSettingsViewController.skipButton(_:)))
       
        for selected in userDefaults.arrayForKey("selectedFoodCats")! {
            if let index = foodCategories.indexOf({$0 == selected as! NSObject}) { // goes through the array selectedFoodCats and sets the switchState for the corresponding value to true if it is inside the array of foods
                switchStates[NSIndexPath(forItem: index, inSection: 0)] = true
            }
        }
        for selected in userDefaults.arrayForKey("selectedActivitiesCats")! { // goes through the array selectedActivitiesCats and sets the switchState for the corresponding value to true if it is inside the array of activities
            if let index = bigActivitiesCategories.indexOf({$0 == selected as! NSObject}) {
                switchStates[NSIndexPath(forItem: index, inSection: 1)] = true
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section)
        {
        case 0:
            return foodCategories.count //Returns number of sections in each header based on number of food categories
        case 1:
            return bigActivitiesCategories.count //Returns number of sections in each header based on number of activity categories
        default:
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCellTableViewCell
        
        cell.backgroundColor = UIColor.clearColor() //sets background to clear
        cell.selectionStyle = .None //sets selection style to none

        cell.delegate = self
        switch(indexPath.section)
        {
        case 0:
        cell.switchLabel?.text = foodCategories[indexPath.row]["name"] //sets name of each cell inside food header
        cell.onSwitch.on = switchStates [indexPath] ?? false
        case 1:
        cell.switchLabel.text = bigActivitiesCategories[indexPath.row]["name"] //sets name of each cell inside activities header
        cell.onSwitch.on = switchStates [indexPath] ?? false
        default:
            cell.switchLabel.text = foodCategories[indexPath.row]["error"]
        }
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2 //Returns number of sections there will be.
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65.0 //returns height of the header section
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("Header") as! HeaderCell
        headerCell.backgroundColor = UIColor.darkGrayColor()//Sets background color of the header section
        headerCell.headerLabel.font = UIFont(name: "Verdana-BoldItalic", size: 25)! //sets font
        headerCell.headerLabel.textColor = UIColor.whiteColor()//sets color of text
        
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "Food" //Sets title of header to "Food"
            headerCell.headerImage.image = UIImage(named: "restaurantsButton") //Sets image in the food header
            
        case 1:
            headerCell.headerLabel.text = "Activities" //sets title of header to "Activities"
            headerCell.headerImage.image = UIImage(named: "activity") //Sets image in activities header
        default:
            headerCell.headerLabel.text = "Error"
            headerCell.headerImage.image = UIImage(named: "activity")
        }
        
        return headerCell
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) { //Function/Gesture that allows swiping left to go to MainMenuViewController
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("moveMain", sender: self)
            default:
                break
                
                
            }
        }
    }

    func switchCell(switchCell: SwitchCellTableViewCell, didChangeValue value: Bool) { //allows detection of a change of value in the switchcell
        let indexPath = tableView.indexPathForCell(switchCell)!
        switchStates[indexPath] = value
    }
    func doneButton(sender: UIBarButtonItem) {
        let filters = [String:AnyObject]()
        var selectedFoodCategories = [[String:String]]()
        var selectedActivitiesCategories = [[String:String]]()
        var catName: String
        //var codeName: String
        
        //Next 3 Lines set up the alert that will pop up once "Done" is pressed
        let alert = UIAlertController(title: "Continue?", message: "Make sure these are the categories you want to exclude from searches before continuing", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: { action in         self.performSegueWithIdentifier("moveMain", sender: nil)})) //Will move to MainMenuViewController once "Continue" is tapped
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        selectedFoodCats = []
        selectedActivitiesCats = []
        
        /*This for loop checks the NSIndexPath of the each cell and checks if the switch state isSelected (true) and if
        the switch state is true it adds the corresponding lists into an array to be used for searching for resturants and activities later and adds it to NSUserDefaults.
        it also adds another string of the bigActivities and customCategories into an array based on what was selected to save the users selected values when they come back to this screen*/
        for (NSIndexPath, isSelected) in switchStates {
            if isSelected {
                if NSIndexPath.section == 0
                {
                    catName = foodCategories[NSIndexPath.row]["name"]!
                    //codeName = foodCategories[NSIndexPath.row]["code"]!
                    switch(catName){
                    case "African":
                        var africanDict = RestruantsList.africanList()
                        for i in 0 ..< RestruantsList.africanList().count {
                            selectedFoodCategories.append(africanDict[i])
                        }
                        selectedFoodCats.append(["name" : "African", "code": "a"])
                        
                    break
                    case "American":
                        var americanDict = RestruantsList.americanList()
                        for i in 0 ..< RestruantsList.americanList().count {
                             selectedFoodCategories.append(americanDict[i])
                            
                        }
                        selectedFoodCats.append(["name" : "American", "code": "b"])

                    break
                    case "Austrialian":
                        var australianDict = RestruantsList.australianList()
                        for i in 0 ..< RestruantsList.australianList().count {
                             selectedFoodCategories.append(australianDict[i])
                        }
                        selectedFoodCats.append(["name" : "Austrialian", "code": "c"])

                    break
                    case "Asian":
                        var asianDict = RestruantsList.asianList()
                        for i in 0 ..< RestruantsList.asianList().count {
                             selectedFoodCategories.append(asianDict[i])
                        }
                        selectedFoodCats.append(["name" : "Asian", "code": "d"])

                    break
                    case "Breakfast":
                        var breakfastDict = RestruantsList.breakfastList()
                        for i in 0 ..< RestruantsList.breakfastList().count {
                             selectedFoodCategories.append(breakfastDict[i])
                        }
                        selectedFoodCats.append(["name" : "Breakfast", "code": "e"])

                    break
                    case "Chinese":
                        var chineseDict = RestruantsList.chineseList()
                        for i in 0 ..< RestruantsList.chineseList().count {
                             selectedFoodCategories.append(chineseDict[i])
                        }
                        selectedFoodCats.append(["name" : "Chinese", "code": "f"])

                    break
                    case "Desserts":
                        var dessertsDict = RestruantsList.dessertList()
                        for i in 0 ..< RestruantsList.dessertList().count {
                             selectedFoodCategories.append(dessertsDict[i])
                        }
                        selectedFoodCats.append(["name" : "Desserts", "code": "g"])

                    break
                    case "European":
                        var europeanDict = RestruantsList.europeanList()
                        for i in 0 ..< RestruantsList.europeanList().count {
                             selectedFoodCategories.append(europeanDict[i])
                        }
                        selectedFoodCats.append(["name" : "European", "code": "h"])

                    break
                    case "Fast Food":
                        var fastfoodDict = RestruantsList.fastfoodList()
                        for i in 0 ..< RestruantsList.fastfoodList().count {
                             selectedFoodCategories.append(fastfoodDict[i])
                        }
                        selectedFoodCats.append(["name" : "Fast Food", "code": "i"])

                    break
                    case "French":
                        var frenchDict = RestruantsList.frenchList()
                        for i in 0 ..< RestruantsList.frenchList().count {
                             selectedFoodCategories.append(frenchDict[i])
                        }
                        selectedFoodCats.append(["name" : "French", "code": "j"])

                    break
                    case "Healthy":
                        var healthyDict = RestruantsList.healthyList()
                        for i in 0 ..< RestruantsList.healthyList().count {
                            selectedFoodCategories.append(healthyDict[i])
                        }
                        selectedFoodCats.append(["name" : "Healthy", "code": "k"])

                    break
                    case "Italian":
                        var italianDict = RestruantsList.italianList()
                        for i in 0 ..< RestruantsList.italianList().count {
                            selectedFoodCategories.append(italianDict[i])
                        }
                        selectedFoodCats.append(["name" : "Italian", "code": "l"])

                    break
                    case "Indian":
                        var indianDict = RestruantsList.indianList()
                        for i in 0 ..< RestruantsList.indianList().count {
                            selectedFoodCategories.append(indianDict[i])
                        }
                        selectedFoodCats.append(["name" : "Indian", "code": "m"])

                    break
                    case "Japanese":
                        var japaneseDict = RestruantsList.japaneseList()
                        for i in 0 ..< RestruantsList.japaneseList().count {
                            selectedFoodCategories.append(japaneseDict[i])
                        }
                        selectedFoodCats.append(["name" : "Japanese", "code": "n"])

                    break
                    case "Latin American":
                        var latinDict = RestruantsList.latinAmericanList()
                        for i in 0 ..< RestruantsList.latinAmericanList().count {
                            selectedFoodCategories.append(latinDict[i])
                        }
                        selectedFoodCats.append(["name" : "Latin American", "code": "o"])

                    break
                    case "Middle Eastern":
                        var middleDict = RestruantsList.middleEasternList()
                        for i in 0 ..< RestruantsList.middleEasternList().count {
                            selectedFoodCategories.append(middleDict[i])
                        }
                        selectedFoodCats.append(["name" : "Middle Eastern", "code": "p"])

                    break
                    case "Medditeranian":
                        var meddDict = RestruantsList.medditeranianList()
                        for i in 0 ..< RestruantsList.medditeranianList().count {
                            selectedFoodCategories.append(meddDict[i])
                        }
                        selectedFoodCats.append(["name" : "Medditeranian", "code": "q"])

                    break
                    case "Thai":
                        var thaiDict = RestruantsList.thaiList()
                        for i in 0 ..< RestruantsList.thaiList().count {
                            selectedFoodCategories.append(thaiDict[i])
                        }
                        selectedFoodCats.append(["name" : "Thai", "code": "r"])

                    break
                    case "Other":
                        var otherDict = RestruantsList.otherList()
                        for i in 0 ..< RestruantsList.otherList().count {
                            selectedFoodCategories.append(otherDict[i])
                        }
                        selectedFoodCats.append(["name" : "Other", "code": "s"])

                    break
                    default:
                    break
                    }
                }
                else if NSIndexPath.section == 1
                {
                    catName = bigActivitiesCategories[NSIndexPath.row]["name"]!
                    //codeName = bigActivitiesCategories[NSIndexPath.row]["code"]!
                    switch (catName){
                        case "Attractions":
                            var attractionsDict = ActivitiesList.attractionsList()
                            for i in 0 ..< ActivitiesList.attractionsList().count {
                                selectedActivitiesCategories.append(attractionsDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Attractions", "code": "0"])
                                break
                    case "Beauty and Spas":
                            var beautyDict = ActivitiesList.beautyList()
                            for i in 0 ..< ActivitiesList.beautyList().count {
                                selectedActivitiesCategories.append(beautyDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Beauty and Spas", "code": "1"])
                            break
                        case "Entertainment":
                            var entertainmentDict = ActivitiesList.entertainmentList()
                            for i in 0 ..< ActivitiesList.entertainmentList().count {
                                selectedActivitiesCategories.append(entertainmentDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Entertainment", "code": "2"])
                        break
                        case "Great Outdoors/Extreme":
                            var extremeDict = ActivitiesList.extremeList()
                            for i in 0 ..< ActivitiesList.extremeList().count {
                                selectedActivitiesCategories.append(extremeDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Great Outdoors/Extreme", "code": "3"])
                        break
                        case "Landmarks/Historical Buildings":
                            var landmarksDict = ActivitiesList.landmarksList()
                            for i in 0 ..< ActivitiesList.landmarksList().count {
                                selectedActivitiesCategories.append(landmarksDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Landmarks/Historical Buildings", "code": "4"])
                        break
                        case "Nightlife":
                            var nightlifeDict = ActivitiesList.nightlifeList()
                            for i in 0 ..< ActivitiesList.nightlifeList().count {
                                selectedActivitiesCategories.append(nightlifeDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Nightlife", "code": "5"])
                        break
                        case "Parks":
                            var parksDict = ActivitiesList.parksList()
                            for i in 0 ..< ActivitiesList.parksList().count {
                                selectedActivitiesCategories.append(parksDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Parks", "code": "6"])
                        break
                        case "Pets":
                            var petsDict = ActivitiesList.petsList()
                            for i in 0 ..< ActivitiesList.petsList().count {
                                selectedActivitiesCategories.append(petsDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Pets", "code": "7"])
                        break
                        case "Professional Sporting Events":
                            var profSportsDict = ActivitiesList.profSportsList()
                            for i in 0 ..< ActivitiesList.profSportsList().count {
                                selectedActivitiesCategories.append(profSportsDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Professional Sporting Events", "code": "8"])
                        break
                        case "Sports":
                            var sportsDict = ActivitiesList.sportsList()
                            for i in 0 ..< ActivitiesList.sportsList().count {
                                selectedActivitiesCategories.append(sportsDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Sports", "code": "9"])
                        break
                        case "Water Activities":
                            var waterDict = ActivitiesList.waterList()
                            for i in 0 ..< ActivitiesList.waterList().count {
                                selectedActivitiesCategories.append(waterDict[i])
                            }
                            selectedActivitiesCats.append(["name" : "Water Activities", "code": "10"])
                        break
                        default:
                        break
                    }
                }
            }
            userDefaults.setObject(selectedActivitiesCategories, forKey: "selectedActivities")
            userDefaults.setObject(selectedFoodCategories, forKey: "selectedFoods")
            userDefaults.setObject(selectedFoodCats, forKey: "selectedFoodCats")
            userDefaults.setObject(selectedActivitiesCats, forKey: "selectedActivitiesCats")
        }
        self.presentViewController(alert, animated: true, completion: nil)
        self.performSegueWithIdentifier("moveMain", sender: nil)
        delegate?.initialSettingsViewController?(self, didUpdateFilters: filters)
    }
    func skipButton(sender: UIBarButtonItem) { //Moves the user to the MainMenuViewController without changing any settings

        self.performSegueWithIdentifier("moveMain", sender: nil)

    }
    
    
}

