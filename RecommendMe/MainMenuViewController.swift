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

    
    var choice: Int!
    var locationManager:CLLocationManager?

    // Temp saved NSUserDefaults
    let CategoryDefaults = NSUserDefaults.standardUserDefaults()
    var tempFoodCategories: [[String: String]]!
    var longitude: String!
    //var latitude: String!
    //static locationManager : CLLocationManager

    override func viewDidLoad() {
        super.viewDidLoad()
       // print("loaded")
       // print("selected Cats: \(CategoryDefaults.objectForKey("selectedFoodCats"))")
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        print(CategoryDefaults.objectForKey("latitude"))
        print(CategoryDefaults.objectForKey("longitude"))


        //let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(array)
       // print(shuffled)
        

        
        // Save defaults
        CategoryDefaults.setObject(tempFoodCategories, forKey: "TempUserSelected")
        
        // Reading from NSUserDefaults example
        
        let testDictionary = CategoryDefaults.objectForKey("selectedActivities") as? [[String: String]] ?? [[String: String]]()
        /*for item in testDictionary {
            for (key, value) in item{
                print("\(key), \(value)")
            }
        }*/
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        locationManager!.requestWhenInUseAuthorization()
        locationManager!.startUpdatingLocation()
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
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations)
        let latitude = locationManager!.location!.coordinate.latitude
        let longitude = locationManager!.location!.coordinate.longitude
        //print(latitude)
        //print(longitude)
        CategoryDefaults.setObject(latitude, forKey: "latitude")
        CategoryDefaults.setObject(longitude, forKey: "longitude")
        //print(latitude)
    }
    
    

}
