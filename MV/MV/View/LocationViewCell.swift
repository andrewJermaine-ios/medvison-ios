//
//  TableViewCell.swift
//  MV
//
//  Created by Andrew on 9/27/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class LocationViewCell: UITableViewCell {

    @IBOutlet weak var locationCellLabel: UILabel!
    
    func configureCell(city: String) {
        locationCellLabel.text = city
    }
    

}
