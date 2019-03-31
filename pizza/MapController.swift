//
//  MapController.swift
//  pizza
//
//  Created by bimal pariyar on 9/24/18.
//  Copyright © 2018 Binod Pariyar. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import GooglePlaces

class MapController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var camera: GMSCameraPosition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        
        camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame:CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        
        view = mapView
        
        let btnChange: UIPizzaButton = UIPizzaButton(frame: CGRect(x: ( screenWidth - 200 )/2, y: screenHeight-150, width: 200, height: 30))
        btnChange.setTitle("Change Location", for: UIControl.State.normal)
//        self.view.addSubview(btnChange)
        
        let btnContinue: UIPizzaButton = UIPizzaButton(frame: CGRect(x: ( screenWidth - 100 )/2, y: screenHeight-90, width: 100, height: 30))
        btnContinue.setTitle("Continue", for: UIControl.State.normal)
        self.view.addSubview(btnContinue)
        
        btnContinue.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("btn pressed")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenuSelectController") as! MenuSelectController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        
        mapView.clear()
        
        camera = GMSCameraPosition.camera(withLatitude:location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 18.0)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        marker.title = "Your current Location"
        marker.snippet = "Australia"
        marker.map = mapView
        
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
