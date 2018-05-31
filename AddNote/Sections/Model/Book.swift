//
//  Books.swift
//  AddNote
//
//  Created by 123 on 2018/5/31.
//  Copyright © 2018年 shilin. All rights reserved.
//

import Foundation
import RealmSwift

class Book: Object {
    @objc dynamic var title = ""
    @objc dynamic var id = 0

    let notes = List<NoteModel>()  // 对多关系
}
