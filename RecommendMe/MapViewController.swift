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
    var latitude : Double!
    var longitutde : Double!
    var resName : String!
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
        var point2 = MKPointAnnotation()
        point2.coordinate = CLLocationCoordinate2DMake(latitude, longitutde/*insert coords of resturant*/)
        point2.title = resName
        mapView.addAnnotation(point2)
        mapView.setCenterCoordinate(point2.coordinate, animated: false)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(point2.coordinate, span)
        mapView.setRegion(region, animated: false)
        
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
    
    /*let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius*2.0, regionRadius*2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }*/
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
   /* func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: false)
        }
    }*/
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mapViewSegue" {
            let mapViewController = segue.destinationViewController as! MapViewController
        }
    }*/
    

}