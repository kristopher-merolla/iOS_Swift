//
//  MapVC.swift
//  Codelaborate
//
//  Created by Kristopher Merolla on 7/13/17.
//  Copyright © 2017 xCoders. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate {
    
    // declare our map view
    @IBOutlet weak var mapView: MKMapView!
    // to drop a pin
    let annotation = MKPointAnnotation()
    var updateSpan: Bool = true
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if updateSpan {
            let location = locations[0]
            
            let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
            let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
            mapView.setRegion(region, animated: true)
            updateSpan = false
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            mapView.addAnnotation(annotation)
        }
        
        self.mapView.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dropPin(_ lat: Double, long: Double) {
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapView.addAnnotation(annotation)
    }

//    @IBAction func savePinLocation(_ sender: UIBarButtonItem) {
//        print("map location saved")
//        print(annotation.coordinate.latitude)
//        print(annotation.coordinate.longitude)
//        dismiss(animated: true, completion: nil)
//    }
    
    
}
