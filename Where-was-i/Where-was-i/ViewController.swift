//
//  ViewController.swift
//  Where-was-i
//
//  Created by Jose Melendez on 8/29/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        //Get the coordinates
        let coord = locationManager.location?.coordinate
        
        if let longitude = coord?.longitude {
            if let latitude = coord?.latitude {
                DataStore().storeDataPoint(latitude: String(latitude), longitude: String(longitude))
            }
        }
        
      
        
        
    }
    //Location Manager 
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        //Info plist
        locationManager.requestWhenInUseAuthorization()
        
        //Update location of the user
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        //If this is true then the else statement won't be executed
        guard status == .authorizedWhenInUse else {
            
            print("Location not enabled!")
            
            return
        }
        
        print("Location allowed")
        
        mapView.showsUserLocation = true
    }

}

