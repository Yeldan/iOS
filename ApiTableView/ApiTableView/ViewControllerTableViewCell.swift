//
//  ViewControllerTableViewCell.swift
//  ApiTableView
//
//  Created by Yeldan_Mac on 10/10/19.
//  Copyright © 2019 Yeldan_Mac. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
