//
//  ViewController.swift
//  KingOfTheHill
//
//  Created by Daniel Richards on 7/23/16.
//  Copyright © 2016 Daniel Richards. All rights reserved.
//

import UIKit
import MapKit

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

    
}

