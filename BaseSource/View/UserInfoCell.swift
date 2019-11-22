//
//  UserInfoCell.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/22/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import UIKit

class UserInfoCell: UITableViewCell {

    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var user: User! {
        didSet {
            bindingData(user)
        }
    }
    
    private func bindingData(_ user: User) {
        displayNameLabel.text = user.displayName
        phoneLabel.text = user.phone
        emailLabel.text = user.email
    }
}
