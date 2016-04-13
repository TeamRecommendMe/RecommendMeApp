//
//  MapViewController.swift
//  RecommendMe
//
//  Created by Ryan Linehan on 4/12/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var locationManager : CLLocationManager!
    var newRoute: MKRoute?
    let userDefaults = NSUserDefaults.standardUserDefaults()

    /*public struct CLLocationCoordinate2D {
        public var latitude: CLLocationDegrees
        public var longitude: CLLocationDegrees
        public init()
        public init(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }*/
    var coords = CLLocationCoordinate2D(latitude: 33.3978272555707, longitude: -111.94202161512978)
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()
        var point1 = MKPointAnnotation()
        var point2 = MKPointAnnotation()
        point1.coordinate = CLLocationCoordinate2DMake(userDefaults.doubleForKey("latitude"), userDefaults.doubleForKey("longitude"))
        point1.title = "Current Location"
        mapView.addAnnotation(point1)
        
        point2.coordinate = CLLocationCoordinate2DMake(33, -111/*insert coords of resturant*/)
        point2.title = "Insert Resturant Name Here"
        mapView.addAnnotation(point2)
        
        //addAnnotationAtCoordinate(coords)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Resturant is here"
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: false)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
