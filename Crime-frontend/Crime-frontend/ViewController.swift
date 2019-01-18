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
    
    @IBAction func startLocationService(_ sender: UIButton){
        //has user authorized location services
        if CLLocationManager.authorizationStatus() == .authorizedAlways ||
            CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            activateLocationServices()
        }else {
            locationManager?.requestWhenInUseAuthorization()
        }
    }
    private func activateLocationServices(){
        
    }
    func loadPlaces(){
        guard let entries = loadPlist() else { fatalError("Unable to load data")}
        for property in entries {
            guard let name = property in entries {
                guard let name = property["Name"] as? String,
                let latitude = property["Latitude"] as? NSNumber,
                let longitude = property["Longitude"] as? NSNumber,
               // let image
                else { fatalError("Error loading data")}
                print("name: \(name)")
                print("lat: \(latitude)")
                print("long: \(longitude)")

            }
        }
        private func loadPlist() -> [[String: Any]]? {
            guard let plistUrl = Bundle.main.url(forResource: "Places", withExtension: "plist"),
                let plistData=try? Data(contentsOf: plistUrl) else{return nil}
            var placedEntries: [[String: Any]]? = nil
            do{
                placedEntries = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [[String: Any]]
            }catch{
                print("error reading plist")
            }
            return placedEntries
        }
    }
    //impletment protocol, extension to view controller
    extension ViewController: CLLocationManagerDelegate{


}

