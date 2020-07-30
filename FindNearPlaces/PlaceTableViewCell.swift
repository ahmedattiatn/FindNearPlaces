//
//  PlaceTableViewCell.swift
//  FindNearPlaces
//
//  Created by Ahmed ATIA on 29/07/2020.
//  Copyright © 2020 Ahmed ATIA. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var placeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
