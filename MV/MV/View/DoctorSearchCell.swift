//
//  DoctorSearchCell.swift
//  MV
//
//  Created by Andrew on 10/30/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class DoctorSearchCell: UITableViewCell {

    @IBOutlet weak var doctorNameLabel: UILabel!
    
    func configureCell(doctorName: String) {
        doctorNameLabel.text = doctorName
    }

}
