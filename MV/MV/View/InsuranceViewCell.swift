//
//  InsuranceViewCell.swift
//  MV
//
//  Created by Andrew on 9/29/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class InsuranceViewCell: UITableViewCell {

    @IBOutlet weak var insuranceLabel: UILabel!
    
    func configureCell(insuranceType: String) {
         insuranceLabel.text = insuranceType
        
    }

}
