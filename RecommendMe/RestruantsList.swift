//
//  RestruantsList.swift
//  RecommendMe
//
//  Created by Josh Gebbeken and Ryan Linehan on 4/28/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit

class RestruantsList: NSObject {
    
    override init() {}
    
    class func customCategories() -> [[String:String]] {
        return [
            ["name" : "African", "code": "a"],
            ["name" : "American", "code": "b"],
            ["name" : "Austrialian", "code": "c"],
            ["name" : "Asian", "code": "d"],
            ["name" : "Breakfast", "code": "e"],
            ["name" : "Chinese", "code": "f"],
            ["name" : "Desserts", "code": "g"],
            ["name" : "European", "code": "h"],
            ["name" : "Fast Food", "code": "i"],
            ["name" : "French", "code": "j"],
            ["name" : "Healthy", "code": "k"],
            ["name" : "Italian", "code": "l"],
            ["name" : "Indian", "code": "m"],
            ["name" : "Japanese", "code": "n"],
            ["name" : "Latin American", "code": "o"],
            ["name" : "Middle Eastern", "code": "p"],
            ["name" : "Medditeranian", "code": "q"],
            ["name" : "Thai", "code": "r"],
            ["name" : "Other", "code": "s"]]
    }
    class func africanList() -> [[String:String]]{
        return [["name" : "African", "code": "african"],
                ["name" : "Ethiopian", "code": "ethiopian"]]
    }
    class func americanList() -> [[String:String]]
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
    class func australianList() -> [[String:String]] {
        return [
            ["name" : "Australian", "code": "australian"],
            ["name" : "Fish & Chips", "code": "fishnchips"],//Austrialian
            ["name" : "Modern Australian", "code": "modern_australian"]]
    }
    class func asianList() -> [[String:String]] {
        return [["name" : "Asian Fusion", "code": "asianfusion"],
                ["name" : "Burmese", "code": "burmese"], //Asian
            ["name" : "Cambodian", "code": "cambodian"],//Asian
            ["name" : "Himalayan/Nepalese", "code": "himalayan"],//Asian
            ["name" : "Korean", "code": "korean"],//Asian
            ["name" : "Malaysian", "code": "malaysian"],//Asian
            ["name" : "Oriental", "code": "oriental"], //Asian
            ["name" : "Vietnamese", "code": "vietnamese"]]
    }
    class func breakfastList() -> [[String:String]] {
        return [["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],//Breakfast
            ["name" : "Cafes", "code": "cafes"], //Breakfast
            ["name" : "Creperies", "code": "creperies"],//Breakfast
            ["name" : "Parent Cafes", "code": "eltern_cafes"]]
    }
    class func latinAmericanList() -> [[String:String]] {
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
    class func chineseList() -> [[String:String]] {
        return [["name" : "Chinese", "code": "chinese"], //Chinese/Asian
            ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
            ["name" : "Mongolian", "code": "mongolian"]]//Chinese
    }
    class func dessertList() -> [[String:String]] {
        return [["name" : "Fondue", "code": "fondue"], //Deserts
            ["name" : "Milk Bars", "code": "milkbars"]]
    }
    class func europeanList() -> [[String:String]]{
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
    class func fastfoodList() -> [[String:String]] {
        return [["name" : "Fast Food", "code": "hotdogs"]]//fastfood
    }
    class func frenchList() -> [[String:String]]{
        return [["name" : "Brasseries", "code": "brasseries"],
                ["name" : "French", "code": "french"], //French/European
            ["name" : "French Southwest", "code": "sud_ouest"]]
    }
    class func healthyList() -> [[String:String]] {
        return [["name" : "Gluten-Free", "code": "gluten_free"],//Healthy?
            ["name" : "Salad", "code": "salad"],// Healthy
            ["name" : "Vegan", "code": "vegan"], //Healthy
            ["name" : "Vegetarian", "code": "vegetarian"]]
    }
    class func italianList() -> [[String:String]]{
        return [["name" : "Italian", "code": "italian"], //Italian/Europe
            ["name" : "Norcinerie", "code": "norcinerie"],
            ["name" : "Corsican", "code": "corsican"]]
    }
    class func indianList() -> [[String:String]]{
        return [["name" : "Indian", "code": "indpak"],//Indian
            ["name" : "Indonesian", "code": "indonesian"]]
    }
    
    
    class func japaneseList() -> [[String:String]] {
        return [["name" : "Japanese", "code": "japanese"],//Japaneese
            ["name" : "Sushi Bars", "code": "sushi"]]
    }
    class func middleEasternList() -> [[String:String]] {
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
    class func medditeranianList() -> [[String:String]] {
        return [["name" : "Mediterranean", "code": "mediterranean"],//Medditeranian
            ["name" : "Romanian", "code": "romanian"]]
    }
    class func thaiList() -> [[String:String]]{
        return [["name" : "Thai", "code": "thai"]]// Thai
    }
    
    class func otherList() -> [[String:String]] {
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
        
    class func allFoodCategories() -> [[String:String]] {
        return [
            ["name" : "African", "code": "african"],
            ["name" : "American, New", "code": "newamerican"],
            ["name" : "American, Traditional", "code": "tradamerican"],
            ["name" : "Australian", "code": "australian"],
            ["name" : "Barbeque", "code": "bbq"],
            ["name" : "Burgers", "code": "burgers"],
            ["name" : "Cheesesteaks", "code": "cheesesteaks"],
            ["name" : "Chicken Wings", "code": "chicken_wings"],
            ["name" : "Diners", "code": "diners"],
            ["name" : "Dumplings", "code": "dumplings"],
            ["name" : "Ethiopian", "code": "ethiopian"],
            ["name" : "Fish & Chips", "code": "fishnchips"],//Austrialian
            ["name" : "Hot Dogs", "code": "hotdog"],
            ["name" : "Pizza", "code": "pizza"],
            ["name" : "Soul Food", "code": "soulfood"],
            ["name" : "Southern", "code": "southern"],
            ["name" : "Steakhouses", "code": "steak"],
            ["name" : "Tex-Mex", "code": "tex-mex"],
            ["name" : "Afghan", "code": "afghani"],//Middle Eastern]
            ["name" : "Arabian", "code": "arabian"],//Middle Eastern
            ["name" : "Asian Fusion", "code": "asianfusion"],
            ["name" : "Asturian", "code": "asturian"],
            ["name" : "Austrian", "code": "austrian"],
            ["name" : "Beisl", "code": "beisl"],
            ["name" : "Belgian", "code": "belgian"],//Europe
            ["name" : "Bistros", "code": "bistros"],//Other
            ["name" : "Brasseries", "code": "brasseries"],
            ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],//Breakfast
            ["name" : "British", "code": "british"], //Europe
            ["name" : "Buffets", "code": "buffets"], //Other
            ["name" : "Bulgarian", "code": "bulgarian"], //Europe
            ["name" : "Burmese", "code": "burmese"], //Asian
            ["name" : "Cafes", "code": "cafes"], //Breakfast
            ["name" : "Cajun/Creole", "code": "cajun"],//French? Or Other.
            ["name" : "Cambodian", "code": "cambodian"],//Asian
            ["name" : "Canadian", "code": "New)"], //North American
            ["name" : "Caribbean", "code": "caribbean"],//Other
            ["name" : "Catalan", "code": "catalan"], //Latin American
            ["name" : "Chech", "code": "chech"], //European
            ["name" : "Chilean", "code": "chilean"], //Latin America
            ["name" : "Chinese", "code": "chinese"], //Chinese/Asian
            ["name" : "Corsican", "code": "corsican"],
            ["name" : "Creperies", "code": "creperies"],//Breakfast
            ["name" : "Cuban", "code": "cuban"],//Latin American
            ["name" : "Czech", "code": "czech"], //Europe
            ["name" : "Czech/Slovakian", "code": "czechslovakian"],//Europe
            ["name" : "Danish", "code": "danish"], //Europe
            ["name" : "Eastern European", "code": "eastern_european"], //European
            ["name" : "Fast Food", "code": "hotdogs"],
            ["name" : "Filipino", "code": "filipino"],//Other
            ["name" : "Fondue", "code": "fondue"], //Deserts
            ["name" : "French Southwest", "code": "sud_ouest"],
            ["name" : "French", "code": "french"], //French/European
            ["name" : "Galician", "code": "galician"],//Latin American
            ["name" : "Georgian", "code": "georgian"],//Other
            ["name" : "German", "code": "german"],//European
            ["name" : "Gluten-Free", "code": "gluten_free"],//Healthy?
            ["name" : "Greek", "code": "greek"], //European
            ["name" : "Halal", "code": "halal"], //Middle East/Muslim????
            ["name" : "Hawaiian", "code": "hawaiian"], //American/Other
            ["name" : "Heuriger", "code": "heuriger"],//European
            ["name" : "Himalayan/Nepalese", "code": "himalayan"],//Asian
            ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
            ["name" : "Hungarian", "code": "hungarian"], //European
            ["name" : "Iberian", "code": "iberian"],//Europe
            ["name" : "Indian", "code": "indpak"],//Indian
            ["name" : "Indonesian", "code": "indonesian"],
            ["name" : "Irish", "code": "irish"],//Europe
            ["name" : "Israeli", "code": "israeli"], //Middle eastern
            ["name" : "Italian", "code": "italian"], //Italian/Europe
            ["name" : "Japanese", "code": "japanese"],//Japaneese
            ["name" : "Kebab", "code": "kebab"],//Middle East
            ["name" : "Korean", "code": "korean"],//Asian
            ["name" : "Kosher", "code": "kosher"],//Jewish
            ["name" : "Kurdish", "code": "kurdish"],//Other
            ["name" : "Latin American", "code": "latin"],//Latin American
            ["name" : "Malaysian", "code": "malaysian"],//Asian
            ["name" : "Mediterranean", "code": "mediterranean"],//Medditeranian
            ["name" : "Mexican", "code": "mexican"], //Latin America
            ["name" : "Middle Eastern", "code": "mideastern"], //Middle Eastern
            ["name" : "Milk Bars", "code": "milkbars"],
            ["name" : "Modern Australian", "code": "modern_australian"],
            ["name" : "Modern European", "code": "modern_european"], //European
            ["name" : "Mongolian", "code": "mongolian"],
            ["name" : "Moroccan", "code": "moroccan"],//Middle eastern
            ["name" : "Night Food", "code": "nightfood"],//Other
            ["name" : "Norcinerie", "code": "norcinerie"],
            ["name" : "Open Sandwiches", "code": "opensandwiches"], //Other
            ["name" : "Oriental", "code": "oriental"], //Asian
            ["name" : "Pakistani", "code": "pakistani"], //Middle East
            ["name" : "Parent Cafes", "code": "eltern_cafes"],["name" : "Brazilian", "code": "brazilian"],//Latin American
            ["name" : "Persian/Iranian", "code": "persian"],
            ["name" : "Peruvian", "code": "peruvian"],//Latin America
            ["name" : "Polish", "code": "polish"], //Europe
            ["name" : "Portuguese", "code": "portuguese"], //Latin American
            ["name" : "Poutineries", "code": "poutineries"], //Canadian
            ["name" : "Romanian", "code": "romanian"],
            ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],// other
            ["name" : "Salad", "code": "salad"],// Healthy
            ["name" : "Sandwiches", "code": "sandwiches"],//other
            ["name" : "Scandinavian", "code": "scandinavian"],//European
            ["name" : "Scottish", "code": "scottish"],//European
            ["name" : "Seafood", "code": "seafood"],
            ["name" : "Spanish", "code": "spanish"],
            ["name" : "Sushi Bars", "code": "sushi"],
            ["name" : "Swiss Food", "code": "swissfood"],//European
            ["name" : "Thai", "code": "thai"],
            ["name" : "Turkish", "code": "turkish"],//European
            ["name" : "Vegan", "code": "vegan"], //Healthy
            ["name" : "Vegetarian", "code": "vegetarian"],
            ["name" : "Vietnamese", "code": "vietnamese"],
            ["name" : "Yugoslav", "code": "yugoslav"]]//European

    }
    
    
    
}
