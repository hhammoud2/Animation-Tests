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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var selectionImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
        profileImage.image = #imageLiteral(resourceName: "Profile Image")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }



    override func layoutSubviews() {
        nameLabel.sizeToFit()
        postLabel.sizeToFit()
        super.layoutSubviews()

    }

    func configureCell(name: String, post: String) {
        nameLabel.text = name
        postLabel.text = post
    }
}

extension PostCell: UITextViewDelegate {

}
