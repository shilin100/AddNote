//
//  CreatBookViewController.swift
//  AddNote
//
//  Created by 123 on 2018/6/12.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import RealmSwift
import SVProgressHUD

class CreatBookViewController: UIViewController {

    @IBOutlet weak var bookName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "新建账本"
        
        // Do any additional setup after loading the view.
    }
    @IBAction func creatBook(_ sender: Any) {
        let realm = try! Realm()

        let book = realm.objects(Book.self)
        let newBook = Book()
        newBook.id = book.count + 1
        
        newBook.title = bookName.text!.count > 0 ? bookName.text! : "新建账本\(book.count + 1)"
        try! realm.write {
            realm.add(newBook)
        }

        UserDefaults.standard.set(newBook.id, forKey: "selectedBook")

        SVProgressHUD.showSuccess(withStatus: "创建成功")
        self.navigationController?.popViewController(animated: true)
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
