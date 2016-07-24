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


public class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
 
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func MenuPressed(_ sender: UIBarButtonItem) {
        toggleSideMenuView()

    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Core Location
        
        
        let manager = CLLocationManager()
        
        manager.delegate? = self
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
        UILPR.minimumPressDuration = 2.0
        
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
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        
        let userLocation:CLLocation = locations[0] as! CLLocation
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.3
        
        let lonDelta:CLLocationDegrees = 0.3
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
            mapView.setRegion(region, animated: true)
        
    }
    
    func locationManager(manager:CLLocationManager, didFailWithError error:NSError)
    {
        print(error)
    }
    

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

