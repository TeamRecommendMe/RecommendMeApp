//
//  AdvancedHeaderCellTableViewCell.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 3/28/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit



class AdvancedHeaderCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var advHeaderLabel: UILabel!
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
