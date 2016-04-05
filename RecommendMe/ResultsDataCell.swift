//
//  ResultsDataCell.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 4/4/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit

class ResultsDataCell: UITableViewCell {
    
    
    @IBOutlet weak var businessProfileImage: UIImageView!
    
    @IBOutlet weak var lblBusinessName: UILabel!

    @IBOutlet weak var lblBusinessAddress: UILabel!
    
    @IBOutlet weak var lblBusinessCityStateZip: UILabel!
    
    
    var business: Business! {
        didSet {
            lblBusinessName.text = business.name
            lblBusinessAddress.text = business.address
            businessProfileImage.setImageWithURL(business.ratingImageURL!)
        }
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
