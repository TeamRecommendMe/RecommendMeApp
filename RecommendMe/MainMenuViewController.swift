  //
//  MainMenuViewController.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 3/22/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit
import GameplayKit
import CoreLocation

class MainMenuViewController: UIViewController, CLLocationManagerDelegate {
    let array : [String] = ["a","b","c"]
    
    var choice: Int!
    
    // Temp saved NSUserDefaults
    let CategoryDefaults = NSUserDefaults.standardUserDefaults()
    var tempFoodCategories: [[String: String]]!
    
    let locationManager = CLLocationManager()
    var latitude: String!
    var longitude: String!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        //let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(array)
       // print(shuffled)
        
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        //locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        // Temp food categories
        tempFoodCategories = tempYelpCategories()
        
        // Save defaults
        CategoryDefaults.setObject(tempFoodCategories, forKey: "TempUserSelected")
        
        // Reading from NSUserDefaults example
        
        let testDictionary = CategoryDefaults.objectForKey("selectedActivities") as? [[String: String]] ?? [[String: String]]()
        for item in testDictionary {
            for (key, value) in item{
                print("\(key), \(value)")
            }
        }
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                print("Gesture Right")
                self.performSegueWithIdentifier("advancedSettings", sender: self)
            case UISwipeGestureRecognizerDirection.Right:
                print("Gesture Left")
                self.performSegueWithIdentifier("initialSettings", sender: self)
            default:
                break
                
                
            }
        }
    }
    

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
       
        
    }
    
    
    
    func tempYelpCategories() -> [[String:String]] {
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
            ["name" : "Yugoslav", "code": "yugoslav"]]
    }
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "recRestaurants") {
            let recommendRestVC = segue.destinationViewController as! ResultsTableViewController
            choice = 0
            recommendRestVC.randomizer = choice
            
        }
        else if(segue.identifier == "recActivities")
        {
            let recommendActVC = segue.destinationViewController as! ResultsTableViewController
            choice = 1
            recommendActVC.randomizer = choice
        }
        
        
        
    }
    

}
