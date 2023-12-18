//
//  aroundMeViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 23/11/23.
//

import UIKit
import MapKit

class aroundMeViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient.png")!)

        // Set the initial region (optional)
        let initialLocation = CLLocationCoordinate2D(latitude: 13.360501, longitude: 74.786369) // Manipal
        let regionRadius: CLLocationDistance = 1000
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)

        // Add sample annotations
        let annotation1 = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 13.346700, longitude: 74.737660), title: "Charitable Trust", subtitle: "Subtitle 1")
        let annotation2 = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 12.982960, longitude: 77.676310), title: "Chosen Generation", subtitle: "Subtitle 2")

        mapView.addAnnotations([annotation1, annotation2])
    }
}


