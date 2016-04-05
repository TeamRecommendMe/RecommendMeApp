//
//  InitialSettingsViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 3/23/16.
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
    var allCategories: [[String:String]]!
    var i = 0
    var switchStates = [NSIndexPath: Bool]()
    let userDefaults = NSUserDefaults.standardUserDefaults()
   // let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    //userDefaults.setBool(false, forKey: "userExists")
   // let masterSubClassDictionary = [“Water": waterArray , “Attractions": attractionsArray]
    override func viewDidLoad() {
        super.viewDidLoad()


        self.tableView.backgroundColor = UIColor.clearColor();
        userDefaults.setBool(true, forKey: "userExists")
        let doneButton = self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "doneButton:")
        foodCategories = yelpCategories()
       // activitiesCategories = yelpActivitiesCategories()
        bigActivitiesCategories = bigActivities()
        allCategories = yelpCategories() + bigActivities()
        //print(allCategories)
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
            return 169
        case 1:
            return 11
        default:
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCellTableViewCell
        cell.delegate = self
        switch(indexPath.section)
        {
        case 0:
        cell.switchLabel?.text = allCategories[indexPath.row]["name"]
        cell.onSwitch.on = switchStates [indexPath] ?? true
        case 1:
        cell.switchLabel.text = bigActivitiesCategories[indexPath.row]["name"]
        //cell.delegate = self
        cell.onSwitch.on = switchStates [indexPath] ?? true
        default:
            cell.switchLabel.text = foodCategories[indexPath.row]["error"]
        }

        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 1
        // Return the number of sections.
        return 2 // <-- HINT - Josh
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("Header") as! HeaderCell
        headerCell.backgroundColor = UIColor.grayColor()
        // Each section is represented in a zero-based format just like how an array is. This finds which section it is on 
        // Updates the header to show a new title. Can you guess what's wrong here? Hint: You already declared how many sections it has from the func numberOfSectionsInTableView.
        // - Josh
        
        switch (section) {
        case 0:
           headerCell.headerLabel.text = "Food"
            print("\(headerCell.headerLabel.text)")
        case 1:
            headerCell.headerLabel.text = "Activities"
        default:
            headerCell.headerLabel.text = "Error"
        }
        
        return headerCell
    }
    
    func switchCell(switchCell: SwitchCellTableViewCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(switchCell)!
        switchStates[indexPath] = value
        print("filters view controller got the switch event")
    }
    func doneButton(sender: UIBarButtonItem) {
        print("im pressed")
        let filters = [String:AnyObject]()
        var selectedFoodCategories = [[String:String]]()
        var selectedActivitiesCategories = [[String:String]]()
        var catName: String
        var codeName: String
        //selectedCategories.removeAll()
        
        for (NSIndexPath, isSelected) in switchStates {
            if isSelected {
                if NSIndexPath.section == 0
                {
                    catName = foodCategories[NSIndexPath.row]["name"]!
                    codeName = foodCategories[NSIndexPath.row]["code"]!
                    selectedFoodCategories.append(["name":catName, "code": codeName])
                    userDefaults.setObject(selectedFoodCategories, forKey: "selectedFoods")
                    print("\(catName)")
                    print("\(codeName)")
                }
                else if NSIndexPath.section == 1
                {
                    catName = activitiesCategories[NSIndexPath.row]["name"]!
                    codeName = activitiesCategories[NSIndexPath.row]["code"]!
                    switch (catName){
                        case "Attractions":
                            var attractionsDict = attractionsList()
                            var name : String
                            var code : String
                            for activity in attractionsDict
                            {
                                for(name, code) in activity{
                                    
                                }
                            }
                        break
                        case "Beauty and Spas":
                        break
                        case "Entertainment":
                        break
                        case "Great Outdoors/Extreme":
                        break
                        case "Landmarks/Historical Buildings":
                        break
                        case "Nightlife":
                        break
                        case "Parks":
                        break
                        case "Pets":
                        break
                        case "Professional Sporting Events":
                        break
                        case "Sports":
                        break
                        case "Water Activities":
                        break
                        default:
                        break
                    }
                    selectedActivitiesCategories.append(["name": catName, "code": codeName])
                    userDefaults.setObject(selectedActivitiesCategories, forKey: "selectedActivities")
                    print(catName)
                    print(codeName)
                }
            }
        }
        //let vc = storyboard.instantiateViewControllerWithIdentifier("NavMainMenu")
        self.performSegueWithIdentifier("moveMain", sender: nil)
        delegate?.initialSettingsViewController?(self, didUpdateFilters: filters)
    }
    func yelpCategories() -> [[String:String]] {
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
    func attractionsList() -> [[String:String]]
    {
        return [["name" : "Amusement Parks", "code": "amusementparks"],
            ["name" : "Aquariums", "code": "aquariums"],
            ["name" : "Arcades", "code": "arcades"],
            ["name" : "Art Galleries", "code": "galleries"],
            ["name" : "Casinos", "code": "casinos"],
            ["name" : "Go Karts", "code": "gokarts"],
            ["name" : "Horse Racing", "code": "horseracing"],
            ["name" : "Laser Tag", "code": "lasertag"],
            ["name" : "Mini Golf", "code": "mini_golf"],
            ["name" : "Museums", "code": "museums"],
            ["name" : "Paintball", "code": "paintball"],
            ["name" : "Skating Rinks", "code": "skatingrinks"],
            ["name" : "Trampoline Parks", "code": "trampoline"],
            ["name" : "Zoos", "code": "zoos"]]
    }
    func beautyList()->[[String:String]]
    {
        //Beauty and Spas
        return [["name" : "Day Spas", "code": "spas"],
        ["name" : "Massage", "code": "massage"],
        ["name" : "Piercing", "code": "piercing"],
        ["name" : "Tanning", "code": "tanning"],
        ["name" : "Tattoo", "code": "tattoo"]]

    }
    func entertainmentList()->[[String:String]]
    {
        //Entertainment
       return [["name" : "Festivals", "code": "festivals"],
        ["name" : "Movies", "code": "movietheatres"],
        ["name" : "Music Venues", "code": "musicvenues"],
        ["name" : "Opera & Ballet", "code": "opera"],
        ["name" : "Theater", "code": "theater"],
        ["name" : "Race Tracks", "code": "racetracks"],
        ["name" : "Social Clubs", "code": "social_clubs"],
        ["name" : "Wineries", "code": "wineries"]]

    }
    func extremeList()->[[String:String]]
    {
        //Extreme/Great Outdoors
        return [["name" : "Climbing", "code": "climbing"],
        ["name" : "Hang Gliding", "code": "hanggliding"],
        ["name" : "Hiking", "code": "hiking"],
        ["name" : "Hot Air Balloons", "code": "hot_air_balloons"],
        ["name" : "Mountain Biking", "code": "mountainbiking"],
        ["name" : "Rafting/Kayaking", "code": "rafting"],
        ["name" : "Skydiving", "code": "skydiving"]]
    }
    func landmarksList()->[[String:String]]
    {
        return [["name" : "Landmarks", "code": "landmarks"]]
    }
    func nightlifeList()->[[String:String]]
    {
        return  [["name" : "Champagne Bars", "code": "champagne_bars"],
        ["name" : "Cocktail Bars", "code": "cocktailbars"],
        ["name" : "Comedy Clubs", "code": "comedyclubs"],
        ["name" : "Country Dance Halls", "code": "countrydancehalls"],
        ["name" : "Dance Clubs", "code": "danceclubs"],
        ["name" : "Dive Bars", "code": "divebars"],
        ["name" : "Gay Bars", "code": "gaybars"],
        ["name" : "Hookah Bars", "code": "hookah_bars"],
        ["name" : "Jazz & Blues", "code": "jazzandblues"],
        ["name" : "Karaoke", "code": "karaoke"],
        ["name" : "Lounges", "code": "lounges"],
        ["name" : "Piano Bars", "code": "pianobars"],
        ["name" : "Pool Halls", "code": "poolhalls"],
        ["name" : "Pubs", "code": "pubs"],
        ["name" : "Sports Bars", "code": "sportsbars"],
        ["name" : "Wine Bars", "code": "wine_bars"]]
    }
    func parksList()->[[String:String]]
    {
        return [["name" : "Playgrounds", "code": "playgrounds"],
        ["name" : "Skate Parks", "code": "skate_parks"]]
    }
    func petsList()->[[String:String]]
    {
        return [["name" : "Animal Parks", "code": "dog_parks"],
        ["name" : "Animal Shelters", "code": "animalshelters"]]
    }
    func profSportsList()->[[String:String]]
    {
        return [["name" : "Amateur Sports Teams", "code": "amateursportsteams"],
            ["name" : "Professional Sports Teams", "code": "sportsteams"],
            ["name" : "Stadiums & Arenas", "code": "stadiumsarenas"]]
    }
    func sportsList()->[[String:String]]
    {
        return [["name" : "Archery", "code": "archery"],
        ["name" : "Badminton", "code": "badminton"],
        ["name" : "Basketball Courts", "code": "basketballcourts"],
        ["name" : "Batting Cages", "code": "battingcages"],
        ["name" : "Bike Rentals", "code": "bikerentals"],
        ["name" : "Boating", "code": "boating"],
        ["name" : "Bowling", "code": "bowling"],
        ["name" : "Disc Golf", "code": "discgolf"],
        ["name" : "Golf", "code": "golf"],
        ["name" : "Gun/Rifle", "code": "gun_ranges"],
        ["name" : "Gymnastics", "code": "gymnastics"],
        ["name" : "Horseback Riding", "code": "horsebackriding"],
        ["name" : "Rock Climbing", "code": "rock_climbing"],
        ["name" : "Soccer", "code": "football"],
        ["name" : "Squash", "code": "squash"],
        ["name" : "Tennis", "code": "tennis"],
        ["name" : "Yoga", "code": "yoga"]]
    }
    func waterList()->[[String:String]]
    {
        return [["name" : "Beaches", "code": "beaches"],
        ["name" : "Fishing", "code": "fishing"],
        ["name" : "Kiteboarding", "code": "kiteboarding"],
        ["name" : "Lakes", "code": "lakes"],
        ["name" : "Paddleboarding", "code": "paddleboarding"],
        ["name" : "Scuba Diving", "code": "scuba"],
        ["name" : "Surfing", "code": "surfing"],
        ["name" : "Swimming Pools", "code": "swimmingpools"],
        ["name" : "Tubing", "code": "tubing"]]
    }
    func bigActivities() -> [[String:String]]
    {
                return [["name" : "Attractions", "code": "yolo"],
                ["name" : "Beauty and Spas", "code": "yolo1"],
                ["name" : "Entertainment", "code": "yolo2"],
                ["name" : "Great Outdoors/Extreme", "code": "yolo3"],
                ["name" : "Landmarks/Historical Buildings", "code": "yolo4"],
                ["name" : "Nightlife", "code": "yolo5"],
                ["name" : "Parks", "code": "yolo6"],
                ["name" : "Pets", "code": "yolo7"],
                ["name" : "Professional Sporting Events", "code": "yolo8"],
                ["name" : "Sports", "code": "yolo9"],
                ["name" : "Water Activities", "code": "yolo10"]]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewControll	er.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*var
    
    var professionalSportsArray[] =             [BasicValue(name : "Amateur Sports Teams", code: "amateursportsteams"),
    BasicValue(name : "Professional Sports Teams", code: "sportsteams"),
    BasicValue(name : "Stadiums & Arenas", code: "stadiumsarenas")],
    
    var sportsArray[] = [BasicValue(name : "Archery", code: "archery"),
     BasicValue(name : "Badminton", code: "badminton"),
     BasicValue(name : "Basketball Courts", code: "basketballcourts"),
     BasicValue(name : "Batting Cages", code: "battingcages"),
     BasicValue(name : "Bike Rentals", code: "bikerentals"),
     BasicValue(name : "Boating", code: "boating"),
     BasicValue(name : "Bowling", code: "bowling"),
     BasicValue( name : "Disc Golf", code: "discgolf"),
     BasicValue(name : "Golf", code: "golf"),
     BasicValue(name : "Gun/Rifle", code: "gun_ranges"),
     BasicValue(name : "Gymnastics", code: "gymnastics"),
     BasicValue(name : "Horseback Riding", code: "horsebackriding"),
     BasicValue(name : "Rock Climbing", code: "rock_climbing"),
     BasicValue(name : "Soccer", code: "football"),
     BasicValue(name : "Squash", code: "squash"),
     BasicValue(name : "Tennis", code: "tennis"),
     BasicValue( name : "Yoga", code: "yoga")]
    
    
    var waterArray[] = [BasicValue(name : "Beaches", code: "beaches"),
    BasicValue(name : "Fishing", code: "fishing"),
    BasicValue(name : "Kiteboarding", code: "kiteboarding"),
    BasicValue(name : "Lakes", code: "lakes"),
    BasicValue(name : "Paddleboarding", code: "paddleboarding"),
    BasicValue(name : "Scuba Diving", code: "scuba"),
    BasicValue(name : "Surfing", code: "surfing"),
    BasicValue(name : "Swimming Pools", code: "swimmingpools"),
    BasicValue(name : "Tubing", code: "tubing")]*/
    
}
/*
class BasicValue {
                var name: String
                var code: String
}*/
