//
//  RoundedCornerButton.swift
//  MV
//
//  Created by Andrew on 10/14/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class RoundedCornerButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 10
    }

}
