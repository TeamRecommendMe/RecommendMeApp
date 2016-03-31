//
//  advDataCell.swift
//  RecommendMe
//
//  Created by Josh Gebbeken on 3/28/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//


import UIKit

@objc protocol AdvSwitchCellDelegate {
    optional func switchCell(advSwitchCell: advDataCell,didChangeValue value: Bool)
}

class advDataCell: UITableViewCell {

    @IBOutlet weak var lblCategoryItem: UILabel!
    @IBOutlet weak var advOnOffSwitch: UISwitch!
    
    
    weak var advDelegate: AdvSwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        advOnOffSwitch.addTarget(self, action: "advSwitchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func advSwitchValueChanged() {
        
        print("Switch Value Changed")
        if advDelegate != nil {
            advDelegate?.switchCell?(self, didChangeValue: advOnOffSwitch.on)
        }
    }

}
