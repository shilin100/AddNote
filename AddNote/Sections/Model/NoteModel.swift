//
//  NoteModel.swift
//  AddNote
//
//  Created by 123 on 2018/5/30.
//  Copyright © 2018年 shilin. All rights reserved.
//

import Foundation
import RealmSwift

class NoteModel: Object {
//    @objc dynamic var id = UUID().uuidString
    @objc dynamic var type = ""
    @objc dynamic var money = ""
    @objc dynamic var date = ""
    @objc dynamic var msg = ""
    @objc dynamic var isEarning = false
    @objc dynamic var interval = 0.0
    @objc dynamic var owner: Book?  // 对一关系

//    override class func indexedProperties() -> [String] {
//        return ["date"]
//    }
//
//    override class func primaryKey() -> String? {
//
//        return "id"
//    }


}
