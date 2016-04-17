//
//  ViewController.swift
//  Maps
//
//  Created by Evan on 4/15/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        
        
        
        
        
        
        
        
        let lat: CLLocationDegrees = 49.0
        let long: CLLocationDegrees = 120.0
        let latDelta: CLLocationDegrees = 10
        let longDelta: CLLocationDegrees = 10
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Somewhere in the middle of no where"
        
        annotation.subtitle = "I'll probably never go here"
        
        map.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 1
        
        map.addGestureRecognizer(uilpgr)
        
        
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        print("Gesture Recognized")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoord: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoord
        
        annotation.title = "Somewhere else in the middle of no where"
        
        annotation.subtitle = "I'll probably never go here either"
        
        map.addAnnotation(annotation)
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        var userLocation: CLLocation = locations[0]
        
        var lattitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        let latDelta: CLLocationDegrees = 10
        let longDelta: CLLocationDegrees = 10
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lattitude, longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
    }


}

