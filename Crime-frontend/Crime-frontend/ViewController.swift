//
//  ViewController.swift
//  Crime-frontend
//
//  Created by Deirdre on 1/16/19.
//  Copyright © 2019 Deirdre. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var locationManager: CLLocationManager?
    var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let childViewController = children.first as? placeScrollViewController{
            placesViewController = childViewController
        }
        loadPlaces()
        locationManager=CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    func selectPlace(){
        print("place selected")
    }


}

