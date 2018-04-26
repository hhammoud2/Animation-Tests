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

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.cancelsTouchesInView = true
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tap)

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

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("PROFILE")
    }
}

extension PostCell: UITextViewDelegate {

}
