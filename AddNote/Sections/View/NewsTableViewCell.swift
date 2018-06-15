//
//  NewsTableViewCell.swift
//  Draw
//
//  Created by 123 on 2018/6/6.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    public var url : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
