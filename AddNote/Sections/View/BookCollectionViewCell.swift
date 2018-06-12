//
//  BookCollectionViewCell.swift
//  AddNote
//
//  Created by 123 on 2018/5/31.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var noteCount: UILabel!
    
    open var bookId = 1
    
}
