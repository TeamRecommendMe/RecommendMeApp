//
//  HeaderCell.swift
//  RecommendMe
//
//  Created by Ryan Linehan on 3/26/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {


    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
