//
//  ViewController+UITableView.swift
//  FindNearPlaces
//
//  Created by Ahmed ATIA on 29/07/2020.
//  Copyright © 2020 Ahmed ATIA. All rights reserved.
//

import UIKit


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPlace", for: indexPath) as! PlaceTableViewCell
        cell.placeNameLabel.text = nameArray[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
}
