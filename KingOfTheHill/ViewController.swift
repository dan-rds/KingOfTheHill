//
//  ViewController.swift
//  KingOfTheHill
//
//  Created by Daniel Richards on 7/23/16.
//  Copyright © 2016 Daniel Richards. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import FirebaseDatabase
import CoreLocation



class ViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func MenuPressed(_ sender: UIBarButtonItem) {
        toggleSideMenuView()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //37.375596, -121.919963
        var latitude:CLLocationDegrees = 37.375596
        var longitude:CLLocationDegrees = -121.919963
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
    
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupEvents(lat: Double, lon: Double) {
        
        if let circleQuery = geoFire?.query(at: center, withRadius: 10.0) {

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

