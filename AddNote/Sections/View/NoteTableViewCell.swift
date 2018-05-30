//
//  NoteTableViewCell.swift
//  AddNote
//
//  Created by 123 on 2018/5/29.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var left: UILabel!
    
    @IBOutlet weak var right: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
