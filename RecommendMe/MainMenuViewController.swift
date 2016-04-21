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
    
    @IBOutlet weak var switchFiveMiles: UISwitch!
    @IBOutlet weak var switchTenMiles: UISwitch!
    @IBOutlet weak var switchTwentyFiveMiles: UISwitch!
    
    
    
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
        
        switchTwentyFiveMiles.setOn(true, animated: true)
        switchTenMiles.setOn(false, animated: true)
        switchFiveMiles.setOn(false, animated: true)
        

        
        CategoryDefaults.setObject(40234, forKey: "radius")

        //let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(array)
       // print(shuffled)
        

        
        // Save defaults
 //       CategoryDefaults.setObject(tempFoodCategories, forKey: "TempUserSelected")
        
        // Reading from NSUserDefaults example
        
     //   let testDictionary = CategoryDefaults.objectForKey("selectedActivities") as? [[String: String]] ?? [[String: String]]()
        /*for item in testDictionary {
            for (key, value) in item{
                print("\(key), \(value)")
            }
        }*/
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func switchFiveMilesChange(sender: AnyObject) {
        
        if switchFiveMiles.on {
            switchTenMiles.on = false
            switchTwentyFiveMiles.on = false
            CategoryDefaults.setObject(8047, forKey: "radius")
            CategoryDefaults.synchronize()
        }
    }
    
    
    
    @IBAction func switchTenMilesChange(sender: AnyObject) {
        
        if switchTenMiles.on {
            switchFiveMiles.on = false
            switchTwentyFiveMiles.on = false
            CategoryDefaults.setObject(16093, forKey: "radius")
            CategoryDefaults.synchronize()
        }
    }


    @IBAction func switchTwentyMilesChange(sender: AnyObject) {
        
        
        if switchTwentyFiveMiles.on {
            switchFiveMiles.on = false
            switchTenMiles.on = false
            CategoryDefaults.setObject(40234, forKey: "radius")
            CategoryDefaults.synchronize()
        }
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
