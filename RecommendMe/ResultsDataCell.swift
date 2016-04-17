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
    
    @IBOutlet weak var lblDistance: UILabel!
    
    var business: Business! {
        didSet {
            
            let noImage = "noImage.png"
            let image = UIImage(named: noImage)
            
            lblBusinessName.text = business.name
            lblBusinessAddress.text = business.address
            lblDistance.text = business.distance
            
            if (business.imageURL != nil) {
                businessProfileImage.setImageWithURL((business.imageURL!))
            }
            else {
                businessProfileImage = UIImageView(image: image)
            }
            
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
