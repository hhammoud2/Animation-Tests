//
//  RoundableImage.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/10/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class RoundableImage: UIImageView {

    override func layoutSubviews() {
        print(self.frame)
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
    }

}
