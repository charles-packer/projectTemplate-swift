//
//  PlayerTableViewCell.swift
//  ProjectTemplate_Swift
//
//  Created by charles_packer on 6/9/16.
//  Copyright © 2016 Hot Streak Games. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell
{
    @IBOutlet
    var playerLabel:UILabel! = UILabel()
    
    func configre(data:PlayerModel)
    {
        playerLabel?.text = data.fullName
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
