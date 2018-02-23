//
//  UserTableViewCell.swift
//  UsefulExamples
//
//  Created by Nitin Khurana on 24/02/18.
//  Copyright © 2018 Nitin Khurana. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var userImage:UIImageView!
    @IBOutlet weak var email:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
