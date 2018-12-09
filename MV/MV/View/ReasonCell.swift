//
//  ReasonCell.swift
//  MV
//
//  Created by Andrew on 9/16/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class ReasonCell: UITableViewCell {

    @IBOutlet weak var reasonLabel: UILabel!
    
    func configureCell(reason: String) {
        reasonLabel.text = reason
    }

}
