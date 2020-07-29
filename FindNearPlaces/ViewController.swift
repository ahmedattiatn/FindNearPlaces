//
//  ViewController.swift
//  FindNearPlaces
//
//  Created by Ahmed ATIA on 29/07/2020.
//  Copyright © 2020 Ahmed ATIA. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    let locManager = CLLocationManager()
    var lat: Double? = 00.00
    var long: Double? = 00.00
    let myAPIKey = MyPersonalApi.apiKey
    
    // let stringGoogleAPI = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8662109375,2.2199235802917094&radius=5000&type=restaurant&keyword=cruise&key=AIzaSyCFgIIfIM9oRE5fCF02pFiLiScMjJrUKwc"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func btnShowClicked(_ sender: Any) {
        //self.printNames()
        searchAPIPLacesFromGoogle()
        print(nameArray)
    }
    
    func searchAPIPLacesFromGoogle() {
        
        // getLocation Services permission
        locManager.requestWhenInUseAuthorization()
        
        // get Current location
        var current : CLLocation!
        if let _ = locManager.location {
            current = locManager.location
            self.long = current.coordinate.longitude
            self.lat = current.coordinate.latitude
        }
        
        //Print the location
        print(self.lat ?? "No Value")
        print(self.long ?? "No Value")
        
        // build the URL
        let stringGoogleAPI = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
            + "location=\(self.lat ?? 48.8662109375),\(self.long ?? 2.2199235802917094)&"
            + "radius=5000&"
            + "type=restaurant&"
            + "keyword=cruise&"
            + "key=\(self.myAPIKey)"
        
        let url = NSURL(string: stringGoogleAPI)
        
        URLSession.shared.dataTask(with: (url as URL?)!,
                                   completionHandler: { (data, response, error) -> Void in
                                    if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                                        if let placesArray = jsonObject.value(forKey: "results") as? NSArray {
                                            for place in placesArray {
                                                if let placeDict = place as? NSDictionary {
                                                    if let name = placeDict.value(forKey: "name"){
                                                        self.nameArray.append(name as! String)
                                                        
                                                        
                                                    }
                                                }
                                            }
                                            DispatchQueue.main.async {
                                                self.tableView.reloadData()
                                            }
                                        }
                                    }
        }).resume()
        //tableView.reloadData()
    }
    
}

