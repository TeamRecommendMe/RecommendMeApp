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
   // var i = 0
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
            return allCategories.count
        case 1:
            return bigActivitiesCategories.count
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
                    switch(catName){
                    case "African":
                        var africanDict = africanList()
                        for i in 0 ..< africanList().count {
                            selectedFoodCategories.append(africanDict[i])
                        }
                        //print(selectedFoodCategories)
                        
                    break
                    case "American":
                        var americanDict = americanList()
                        for i in 0 ..< americanList().count {
                             selectedFoodCategories.append(americanDict[i])
                        }
                        
                    break
                    case "Australian":
                        var australianDict = attractionsList()
                        for i in 0 ..< australianList().count {
                             selectedFoodCategories.append(australianDict[i])
                        }
                        
                    break
                    case "Asian":
                        var asianDict = asianList()
                        for i in 0 ..< asianList().count {
                             selectedFoodCategories.append(asianDict[i])
                        }
                        
                    break
                    case "Breakfast":
                        var breakfastDict = attractionsList()
                        for i in 0 ..< breakfastList().count {
                             selectedFoodCategories.append(breakfastDict[i])
                        }
                        
                    break
                    case "Chinese":
                        var chineseDict = chineseList()
                        for i in 0 ..< chineseList().count {
                             selectedFoodCategories.append(chineseDict[i])
                        }
                        
                    break
                    case "Deserts":
                        var desertsDict = desertList()
                        for i in 0 ..< desertList().count {
                             selectedFoodCategories.append(desertsDict[i])
                        }
                        
                    break
                    case "European":
                        var europeanDict = europeanList()
                        for i in 0 ..< europeanList().count {
                             selectedFoodCategories.append(europeanDict[i])
                        }
                        
                    break
                    case "Fast Food":
                        var fastfoodDict = fastfoodList()
                        for i in 0 ..< fastfoodList().count {
                             selectedFoodCategories.append(fastfoodDict[i])
                        }
                        
                    break
                    case "French":
                        var frenchDict = frenchList()
                        for i in 0 ..< frenchList().count {
                             selectedFoodCategories.append(frenchDict[i])
                        }
                        
                    break
                    case "Healthy":
                        var healthyDict = healthyList()
                        for i in 0 ..< healthyList().count {
                            selectedFoodCategories.append(healthyDict[i])
                        }
                        
                    break
                    case "Italian":
                        var italianDict = italianList()
                        for i in 0 ..< italianList().count {
                            selectedFoodCategories.append(italianDict[i])
                        }
                        
                    break
                    case "Indian":
                        var indianDict = attractionsList()
                        for i in 0 ..< indianList().count {
                            selectedFoodCategories.append(indianDict[i])
                        }
                        
                    break
                    case "Japanese":
                        var japaneseDict = japaneseList()
                        for i in 0 ..< japaneseList().count {
                            selectedFoodCategories.append(japaneseDict[i])
                        }
                        
                    break
                    case "Latin American":
                        var latinDict = latinAmericanList()
                        for i in 0 ..< latinAmericanList().count {
                            selectedFoodCategories.append(latinDict[i])
                        }
                        
                    break
                    case "Middle Eastern":
                        var middleDict = middleEasternList()
                        for i in 0 ..< middleEasternList().count {
                            selectedFoodCategories.append(middleDict[i])
                        }
                        
                    break
                    case "Medditeranian":
                        var meddDict = medditeranianList()
                        for i in 0 ..< medditeranianList().count {
                            selectedFoodCategories.append(meddDict[i])
                        }
                        
                    break
                    case "Thai":
                        var thaiDict = thaiList()
                        for i in 0 ..< thaiList().count {
                            selectedFoodCategories.append(thaiDict[i])
                        }
                        
                    break
                    case "Other":
                        var otherDict = otherList()
                        for i in 0 ..< otherList().count {
                            selectedFoodCategories.append(otherDict[i])
                        }
                        
                    break
                    default:
                    break
                    }
                    //print("\(catName)")
                   // print("\(codeName)")
                }
                else if NSIndexPath.section == 1
                {
                    catName = bigActivitiesCategories[NSIndexPath.row]["name"]!
                    codeName = bigActivitiesCategories[NSIndexPath.row]["code"]!
                   // print(catName)
                   // print(codeName)
                    switch (catName){
                        case "Attractions":
                            var attractionsDict = attractionsList()
                            for i in 0 ..< attractionsList().count {
                                selectedActivitiesCategories.append(attractionsDict[i])
                            }
                                break
                    case "Beauty and Spas":
                            var beautyDict = beautyList()
                            for i in 0 ..< beautyList().count {
                                selectedActivitiesCategories.append(beautyDict[i])
                            }
                            break
                        case "Entertainment":
                            var entertainmentDict = entertainmentList()
                            for i in 0 ..< beautyList().count {
                                selectedActivitiesCategories.append(entertainmentDict[i])
                            }
                        break
                        case "Great Outdoors/Extreme":
                            var extremeDict = extremeList()
                            for i in 0 ..< extremeList().count {
                                selectedActivitiesCategories.append(extremeDict[i])
                            }
                        break
                        case "Landmarks/Historical Buildings":
                            var landmarksDict = landmarksList()
                            for i in 0 ..< landmarksList().count {
                                selectedActivitiesCategories.append(landmarksDict[i])
                            }
                        break
                        case "Nightlife":
                            var nightlifeDict = nightlifeList()
                            for i in 0 ..< nightlifeList().count {
                                selectedActivitiesCategories.append(nightlifeDict[i])
                            }
                        break
                        case "Parks":
                            var parksDict = parksList()
                            for i in 0 ..< parksList().count {
                                selectedActivitiesCategories.append(parksDict[i])
                            }
                        break
                        case "Pets":
                            var petsDict = petsList()
                            for i in 0 ..< petsList().count {
                                selectedActivitiesCategories.append(petsDict[i])
                            }
                        break
                        case "Professional Sporting Events":
                            var profSportsDict = profSportsList()
                            for i in 0 ..< profSportsList().count {
                                selectedActivitiesCategories.append(profSportsDict[i])
                            }
                        break
                        case "Sports":
                            var sportsDict = sportsList()
                            for i in 0 ..< sportsList().count {
                                selectedActivitiesCategories.append(sportsDict[i])
                            }
                        break
                        case "Water Activities":
                            var waterDict = waterList()
                            for i in 0 ..< waterList().count {
                                selectedActivitiesCategories.append(waterDict[i])
                            }
                        break
                        default:
                        break
                    }
                   // selectedActivitiesCategories.append(["name": catName, "code": codeName])

                   // print(catName)
                    //print(codeName)
                }
            }
            print("These are the foods selected")
            print(selectedFoodCategories)
            userDefaults.setObject(selectedActivitiesCategories, forKey: "selectedActivities")
            userDefaults.setObject(selectedFoodCategories, forKey: "selectedFoods")
            print("Printing what is saved to userDefaults")
            print(userDefaults.arrayForKey("selectedFoods"))
        }
        //let vc = storyboard.instantiateViewControllerWithIdentifier("NavMainMenu")
        //print(selectedActivitiesCategories)
        //print(selectedFoodCategories)
        self.performSegueWithIdentifier("moveMain", sender: nil)
        delegate?.initialSettingsViewController?(self, didUpdateFilters: filters)
    }
    func yelpCategories() -> [[String:String]] {
        return [
            /*["name" : "Argentine", "code": "argentine"],
            ["name" : "Armenian", "code": "armenian"],
            ["name" : "Baguettes", "code": "baguettes"],
            ["name" : "Bangladeshi", "code": "bangladeshi"],
            ["name" : "Basque", "code": "basque"],
            ["name" : "Bavarian", "code": "bavarian"],
           

        
            ["name" : "Singaporean", "code": "singaporean"],
            ["name" : "Slovakian", "code": "slovakian"],
            ["name" : "Swedish", "code": "swedish"],*/
        
        ["name" : "African", "code": "a"],
            ["name" : "American", "code": "b"],
            ["name" : "Austrialian", "code": "c"],
            ["name" : "Asian", "code": "d"],
            ["name" : "Breakfast", "code": "e"],
            ["name" : "Chinese", "code": "f"],
            ["name" : "Deserts", "code": "g"],
            ["name" : "European", "code": "h"],
            ["name" : "Fast Food", "code": "i"],
            ["name" : "French", "code": "j"],
            ["name" : "Healthy", "code": "k"],
            ["name" : "Italian", "code": "l"],
            ["name" : "Indian", "code": "m"],
            ["name" : "Japaneese", "code": "n"],
            ["name" : "Latin American", "code": "o"],
            ["name" : "Middle Eastern", "code": "p"],
            ["name" : "Medditeranian", "code": "q"],
            ["name" : "Thai", "code": "r"],
            ["name" : "Other", "code": "s"]]
    }
    func africanList() -> [[String:String]]{
        return [["name" : "African", "code": "african"],
                ["name" : "Ethiopian", "code": "ethiopian"]]
    }
    func americanList() -> [[String:String]]
    {
        return [["name" : "American, New", "code": "newamerican"],
            ["name" : "American, Traditional", "code": "tradamerican"],
            ["name" : "Burgers", "code": "burgers"],
            ["name" : "Barbeque", "code": "bbq"],
            ["name" : "Cheesesteaks", "code": "cheesesteaks"],
            ["name" : "Chicken Wings", "code": "chicken_wings"],
            ["name" : "Diners", "code": "diners"],
            ["name" : "Dumplings", "code": "dumplings"],
            ["name" : "Hot Dogs", "code": "hotdog"],
            ["name" : "Soul Food", "code": "soulfood"],
            ["name" : "Southern", "code": "southern"],
            ["name" : "Steakhouses", "code": "steak"],
            ["name" : "Tex-Mex", "code": "tex-mex"],
            ["name" : "Pizza", "code": "pizza"]]
    }
    func australianList() -> [[String:String]] {
        return [
         ["name" : "Australian", "code": "australian"],
         ["name" : "Fish & Chips", "code": "fishnchips"],//Austrialian
         ["name" : "Modern Australian", "code": "modern_australian"]]
    }
    func asianList() -> [[String:String]] {
        return [["name" : "Asian Fusion", "code": "asianfusion"],
            ["name" : "Burmese", "code": "burmese"], //Asian
            ["name" : "Cambodian", "code": "cambodian"],//Asian
            ["name" : "Himalayan/Nepalese", "code": "himalayan"],//Asian
            ["name" : "Korean", "code": "korean"],//Asian
            ["name" : "Malaysian", "code": "malaysian"],//Asian
            ["name" : "Oriental", "code": "oriental"], //Asian
            ["name" : "Vietnamese", "code": "vietnamese"]]
    }
    func breakfastList() -> [[String:String]] {
        return [["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],//Breakfast
            ["name" : "Cafes", "code": "cafes"], //Breakfast
            ["name" : "Creperies", "code": "creperies"],//Breakfast
            ["name" : "Parent Cafes", "code": "eltern_cafes"]]
    }
    func latinAmericanList() -> [[String:String]] {
        return [["name" : "Brazilian", "code": "brazilian"],//Latin American
            ["name" : "Catalan", "code": "catalan"], //Latin American
            ["name" : "Chilean", "code": "chilean"], //Latin America
            ["name" : "Cuban", "code": "cuban"],//Latin American
            ["name" : "Galician", "code": "galician"],//Latin American
            ["name" : "Latin American", "code": "latin"],//Latin American
            ["name" : "Mexican", "code": "mexican"], //Latin America
            ["name" : "Peruvian", "code": "peruvian"],//Latin America
            ["name" : "Portuguese", "code": "portuguese"], //Latin American
            ["name" : "Spanish", "code": "spanish"]]
    }
    func chineseList() -> [[String:String]] {
        return [["name" : "Chinese", "code": "chinese"], //Chinese/Asian
                ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
                ["name" : "Mongolian", "code": "mongolian"]]//Chinese
    }
    func desertList() -> [[String:String]] {
        return [["name" : "Fondue", "code": "fondue"], //Deserts
            ["name" : "Milk Bars", "code": "milkbars"]]
    }
    func europeanList() -> [[String:String]]{
       return [["name" : "Austrian", "code": "austrian"],
        ["name" : "Asturian", "code": "asturian"],
        ["name" : "Beisl", "code": "beisl"],
        ["name" : "Belgian", "code": "belgian"],//Europe
        ["name" : "British", "code": "british"], //Europe
        ["name" : "Bulgarian", "code": "bulgarian"], //Europe
        ["name" : "Chech", "code": "chech"], //European
        ["name" : "Czech", "code": "czech"], //Europe
        ["name" : "Czech/Slovakian", "code": "czechslovakian"],//Europe
        ["name" : "Danish", "code": "danish"], //Europe
        ["name" : "Eastern European", "code": "eastern_european"], //European
        ["name" : "German", "code": "german"],//European
        ["name" : "Greek", "code": "greek"], //European
        ["name" : "Heuriger", "code": "heuriger"],//European
        ["name" : "Hungarian", "code": "hungarian"], //European
        ["name" : "Iberian", "code": "iberian"],//Europe
        ["name" : "Irish", "code": "irish"],//Europe
        ["name" : "Modern European", "code": "modern_european"], //European
        ["name" : "Polish", "code": "polish"], //Europe
        ["name" : "Scandinavian", "code": "scandinavian"],//European
        ["name" : "Scottish", "code": "scottish"],//European
        ["name" : "Swiss Food", "code": "swissfood"],//European
        ["name" : "Turkish", "code": "turkish"],//European
        ["name" : "Yugoslav", "code": "yugoslav"]]//European

        
    }
    func fastfoodList() -> [[String:String]] {
        return [["name" : "Fast Food", "code": "hotdogs"]]//fastfood
    }
    func frenchList() -> [[String:String]]{
        return [["name" : "Brasseries", "code": "brasseries"],
                ["name" : "French", "code": "french"], //French/European
                ["name" : "French Southwest", "code": "sud_ouest"]]
    }
    func healthyList() -> [[String:String]] {
        return [["name" : "Gluten-Free", "code": "gluten_free"],//Healthy?
            ["name" : "Salad", "code": "salad"],// Healthy
            ["name" : "Vegan", "code": "vegan"], //Healthy
            ["name" : "Vegetarian", "code": "vegetarian"]]
    }
    func italianList() -> [[String:String]]{
        return [["name" : "Italian", "code": "italian"], //Italian/Europe
            ["name" : "Norcinerie", "code": "norcinerie"],
            ["name" : "Corsican", "code": "corsican"]]
    }
    func indianList() -> [[String:String]]{
        return [ ["name" : "Indian", "code": "indpak"],//Indian
            ["name" : "Indonesian", "code": "indonesian"]]
    }


    func japaneseList() -> [[String:String]] {
        return [["name" : "Japanese", "code": "japanese"],//Japaneese
            ["name" : "Sushi Bars", "code": "sushi"],
]
    }
    func middleEasternList() -> [[String:String]] {
        return [["name" : "Afghan", "code": "afghani"],//Middle Eastern]
            ["name" : "Arabian", "code": "arabian"],//Middle Eastern
            ["name" : "Halal", "code": "halal"], //Middle East/Muslim????
            ["name" : "Israeli", "code": "israeli"], //Middle eastern
            ["name" : "Kebab", "code": "kebab"],//Middle East
            ["name" : "Middle Eastern", "code": "mideastern"], //Middle Eastern
            ["name" : "Moroccan", "code": "moroccan"],//Middle eastern
            ["name" : "Pakistani", "code": "pakistani"], //Middle East
            ["name" : "Persian/Iranian", "code": "persian"]] //Middle eastern


        
    }
    func medditeranianList() -> [[String:String]] {
        return [["name" : "Mediterranean", "code": "mediterranean"],//Medditeranian 
            ["name" : "Romanian", "code": "romanian"]]
    }
    func thaiList() -> [[String:String]]{
        return [["name" : "Thai", "code": "thai"]]// Thai
        }

    func otherList() -> [[String:String]] {
        return [["name" : "Bistros", "code": "bistros"],//Other
            ["name" : "Buffets", "code": "buffets"], //Other
            ["name" : "Cajun/Creole", "code": "cajun"],//French? Or Other.
            ["name" : "Canadian", "code": "New)"], //North American
            ["name" : "Caribbean", "code": "caribbean"],//Other
            ["name" : "Filipino", "code": "filipino"],//Other
            ["name" : "Georgian", "code": "georgian"],//Other
            ["name" : "Hawaiian", "code": "hawaiian"], //American/Other
            ["name" : "Kosher", "code": "kosher"],//Jewish
            ["name" : "Kurdish", "code": "kurdish"],//Other
            ["name" : "Night Food", "code": "nightfood"],//Other
            ["name" : "Open Sandwiches", "code": "opensandwiches"], //Other
            ["name" : "Poutineries", "code": "poutineries"], //Canadian
            ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],// other
            ["name" : "Sandwiches", "code": "sandwiches"],//other
            ["name" : "Seafood", "code": "seafood"]]
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
