//
//  AvailableDoctorCeall.swift
//  MV
//
//  Created by Andrew on 10/28/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class AvailableDoctorCell: UITableViewCell {

    @IBOutlet weak var doctorLabel: UILabel!
    @IBOutlet weak var locationlabel: UILabel!
    
    func configureCell(doctorName: String, location: String) {
        doctorLabel.text = doctorName
        locationlabel.text = location
        
    }
    
}
