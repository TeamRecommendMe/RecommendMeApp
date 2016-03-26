//
//  SwitchCellTableViewCell.swift
//  RecommendMe
//
//  Created by Ryan Linehan on 3/26/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit


@objc protocol SwitchCellTableViewCellDelegate {
    optional func switchCell(switchCell: SwitchCellTableViewCell, didChangeValue value: Bool)
}


class SwitchCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate: SwitchCellTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged()
    {
        print("switch value changed")
        delegate?.switchCell?(self, didChangeValue: onSwitch.on)
        
    }
    
}
