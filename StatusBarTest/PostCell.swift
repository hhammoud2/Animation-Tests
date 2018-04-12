//
//  PostCell.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/10/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImage: RoundableImage!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.image = #imageLiteral(resourceName: "Profile Image")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func configureCell(name: String, post: String) {
        nameView.text = name
        textView.text = post
    }
}
