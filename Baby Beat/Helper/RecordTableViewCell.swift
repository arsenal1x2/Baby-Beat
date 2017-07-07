//
//  RecordTableViewCell.swift
//  Baby Beat
//
//  Created by may985 on 7/7/17.
//  Copyright © 2017 may985. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet weak var labelDateTime: UILabel!
    @IBOutlet weak var labelNameRecord: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
