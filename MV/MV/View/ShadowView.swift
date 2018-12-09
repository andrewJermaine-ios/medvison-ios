//
//  ShadowView.swift
//  MV
//
//  Created by Andrew on 9/29/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
@IBDesignable

class ShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowOpacity = 0.75
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

}
