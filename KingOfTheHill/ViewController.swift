//
//  ViewController.swift
//  KingOfTheHill
//
//  Created by Daniel Richards on 7/23/16.
//  Copyright © 2016 Daniel Richards. All rights reserved.
//

import UIKit
import MapKit

import CoreLocation

import Firebase
import FirebaseDatabase
import CoreLocation

public class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {




    

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    @IBAction func MenuPressed(_ sender: UIBarButtonItem) {
        toggleSideMenuView()

    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Core Location
        
        
        
        
       manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        
        
//37.375596, -121.919963
        
        let latitude:CLLocationDegrees = 37.375596
        let longitude:CLLocationDegrees = -121.919963
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
    
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)

//Adding pins (with code)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Paypal"
        annotation.subtitle = "Headquarters"
        
        mapView.addAnnotation(annotation)
        
//User adding pins
        
        let UILPR = UILongPressGestureRecognizer(target: self, action: #selector(actionx))
        UILPR.minimumPressDuration = 0.5 
        
        mapView.addGestureRecognizer(UILPR)
        
   
    }
    
    public func actionx(gestureRecognizer:UIGestureRecognizer){
        
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        
        let newCoordinate:CLLocationCoordinate2D = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        
        let newAnnotation = MKPointAnnotation()
        
        newAnnotation.coordinate = newCoordinate
        newAnnotation.title = "New Point"
        newAnnotation.subtitle = "Subtitle"
        
        mapView.addAnnotation(newAnnotation)
    }
    let latDelta:CLLocationDegrees = 0.01
    
    let lonDelta:CLLocationDegrees = 0.01
    
    
    //func locationManager(_ manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
            mapView.setRegion(region, animated: true)
        
        print("\(userLocation)")
        
        setupEvents(lat: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude);
        storeLoc(name: "daniel", lat: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude)
    }
    
    public func locationManager(_ manager:CLLocationManager, didFailWithError error:NSError)
    {
        print(error)
    }
    

   // override func didReceiveMemoryWarning() {
    //    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    //}
    
    func setupEvents(lat: Double, lon: Double) {
        let geofireRef = FIRDatabase.database().reference()
        let geoFire = GeoFire(firebaseRef: geofireRef)
        
        
        if let circleQuery = geoFire?.query(at: CLLocation(latitude: lat, longitude: lon), withRadius: 10.0) {

            let queryHandle = circleQuery.observe(.keyEntered, with: { (key, location) in
                print("key = \(key) location = \(location)")
            })
            print("handle = \(queryHandle)")
        } else {
            print("circle query is nil")
        }

 
    }
    
    func storeLoc(name: String, lat: Double, lon: Double) {
        let geofireRef = FIRDatabase.database().reference()
        let geoFire = GeoFire(firebaseRef: geofireRef)

        geoFire?.setLocation(CLLocation(latitude: lat, longitude: lon), forKey: name)
    }
    
    func getLoc(name: String) {
        
        let geofireRef = FIRDatabase.database().reference()
        let geoFire = GeoFire(firebaseRef: geofireRef)

        geoFire?.getLocationForKey(name, withCallback: { (location, error) in
            if (error != nil) {
                print("An error occurred getting the location: \(error?.localizedDescription)")
            } else if (location != nil) {
                print("Location for \(name) is [\(location?.coordinate.latitude), \(location?.coordinate.longitude)]")
            } else {
                print("GeoFire does not contain a location for \"firebase-hq\"")
            }
        })
    }

}
