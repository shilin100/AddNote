//
//  AddViewController.swift
//  AddNote
//
//  Created by 123 on 2018/5/30.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import SVProgressHUD
import RealmSwift
import IQKeyboardManagerSwift

class AddViewController: UIViewController {

    @IBOutlet weak var typeTF: UITextField!
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var moneyTF: UITextField!
    @IBOutlet weak var msgTV: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var addAgainBtn: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        let timeInterval = date.timeIntervalSince1970
        dateBtn.setTitle(AddViewController.timeStampToString(timeStamp: "\(timeInterval)"), for: .normal)
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true

    }

    
    
    func saveNote()  {
        let note = NoteModel()
        if typeTF.text?.count == 0 , moneyTF.text?.count == 0 {
            SVProgressHUD.showError(withStatus: "请填写完整信息")
            SVProgressHUD.dismiss(withDelay: 0.5)
            return
        }
        (typeTF.text != nil) ? note.type = typeTF.text! : SVProgressHUD.showError(withStatus: "请输入类型")
        (moneyTF.text != nil) ? note.money = moneyTF.text! : SVProgressHUD.showError(withStatus: "请输入金额")
        note.date = dateBtn.titleLabel!.text!
        let sec = Int(NSDate().timeIntervalSince1970)%60
        
        note.interval = Double(AddViewController.stringToTimeStamp(stringTime: dateBtn.titleLabel!.text!))! + Double(sec)
        note.msg = msgTV.text ?? "无"
        note.isEarning = segment.selectedSegmentIndex == 1
        let realm = try! Realm()
        let book = realm.objects(Book.self).filter("id = %d", UserDefaults.standard.value(forKey: "selectedBook")!)
        note.owner = book.first
        
        let notes = realm.objects(NoteModel.self)
        note.noteId = notes.count+1
        
        try! realm.write {
            realm.add(note)
            book.first?.notes.append(note)
        }

    }
    static func stringToTimeStamp(stringTime:String)->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日HH时mm分"
        let date = dfmatter.date(from: stringTime)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
        print(dateSt)
        return String(dateSt)
        
    }
    
    static func timeStampToString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日HH时mm分"
        
        let date = Date(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from: date))
        return dfmatter.string(from: date)
    }
    

    @IBAction func saveBtnAction(_ sender: Any) {
        saveNote()
        if typeTF.text?.count == 0 , moneyTF.text?.count == 0 {
            return
        }

        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAgainBtnAction(_ sender: Any) {
        saveNote()
        if typeTF.text?.count == 0 , moneyTF.text?.count == 0 {
            return
        }
        let date = NSDate()
        let timeInterval = date.timeIntervalSince1970
        dateBtn.setTitle(AddViewController.timeStampToString(timeStamp: "\(timeInterval)"), for: .normal)
        typeTF.text = ""
        msgTV.text = ""
        moneyTF.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
