//
//  ViewController.swift
//  USERLOCATION
//
//  Created by Ekansh Anand Srivastava on 11/12/18.
//  Copyright © 2018 Avi Srivastava. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
    }
    
    var locationmanager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let userlocation : CLLocation = locations[0]
        let latitude = userlocation.coordinate.latitude
        let longitude = userlocation.coordinate.longitude
        let latideltazoom : CLLocationDegrees = 0.05
        let longideltazoom : CLLocationDegrees = 0.05
        let span :  MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latideltazoom, longitudeDelta: longideltazoom)
        let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        let annotations = MKPointAnnotation()
        annotations.title = "USER'S LOCATION"
        annotations.coordinate = coordinate
        mapview.addAnnotation(annotations)
        
        mapview.setRegion(region, animated: true)
        
        
    }
    
    @IBOutlet weak var mapview: MKMapView!
    


}

