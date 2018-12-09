//
//  HomeTableCell.swift
//  MV
//
//  Created by Andrew on 9/14/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {

  
    @IBOutlet weak var specialtyLabel: UILabel!
    
    func configureCell(specialty: String) {
        specialtyLabel.text = specialty
    }
    
}
