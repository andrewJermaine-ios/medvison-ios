//
//  AvailableTimesAndLocationCell.swift
//  MV
//
//  Created by Andrew on 10/28/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class AvailableTimesAndLocationCell: UITableViewCell {

    
    @IBOutlet weak var timesLabel: UILabel!
    
    
    func configureCell(openTimes: String) {
        timesLabel.text = openTimes
    }
    
}
