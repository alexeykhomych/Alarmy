//
//  AlarmListTableViewCell.swift
//  Alarmy
//
//  Created by Alexey Khomych on 4/25/17.
//  Copyright © 2017 Alexey Khomych. All rights reserved.
//

import UIKit

class AlarmListTableViewCell: UITableViewCell {
    
    @IBOutlet var timeLabel: UILabel?
    @IBOutlet var daysLabel: UILabel?
    @IBOutlet var enableSwitch: UISwitch?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(_ model: Alarm) {
        self.timeLabel?.text = model.time
        self.daysLabel?.text = model.days
        self.enableSwitch?.setOn(true, animated: true)
    }
}
