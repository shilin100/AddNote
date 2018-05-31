//
//  NotesViewController.swift
//  AddNote
//
//  Created by 123 on 2018/5/28.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift
import RealmSwift
import Realm


class NotesViewController: UIViewController,StoryboardView {
    @IBOutlet weak var earningLabel: UILabel!
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    var dataArr : Results<NoteModel>?

    var disposeBag = DisposeBag()
    typealias Reactor = NotesViewReactor

    func bind(reactor: Reactor) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableview.separatorStyle = .none
        tableview.delegate = self
        tableview.dataSource = self
        let realm = try! Realm()
        
        let book = realm.objects(Book.self)
        if book.count == 0 {
            let firstBook = Book()
            firstBook.title = "日常账本"
            firstBook.id = 1
            try! realm.write {
                realm.add(firstBook)
            }

//            realm.beginWrite()
//            try! realm.commitWrite()
            UserDefaults.standard.set(1, forKey: "selectedBook")
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let realm = try! Realm()

        let notes = realm.objects(NoteModel.self)
        if notes.count > 0 {
            let book = realm.objects(Book.self).filter("id = %d", UserDefaults.standard.value(forKey: "selectedBook") ?? 1)
            dataArr = book.first?.notes.sorted(byKeyPath: "interval" ,ascending:false)
            
            var earning = 0.0
            var expense = 0.0
            for model in dataArr!{
                if model.isEarning{
                    earning += Double(model.money)!
                }else{
                    expense += Double(model.money)!
                }
            }
            earningLabel.text = String(format: "%.2f", earning)
            expenseLabel.text = String(format: "%.2f", expense)

            tableview.reloadData()
        }
        print(realm.configuration.fileURL!)

    }

    
    func setupUI() {

        
        self.navigationController?.navigationBar.titleTextAttributes = [kCTForegroundColorAttributeName:UIColor.white] as [NSAttributedStringKey : Any]

        // 2.设置导航栏前景色：设置item指示色
        self.navigationController?.navigationBar.tintColor = UIColor.purple
        // 3.设置导航栏半透明
        self.navigationController?.navigationBar.isTranslucent = true
        // 4.设置导航栏背景图片
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // 5.设置导航栏阴影图片
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        addBtn.layer.cornerRadius = 60;

    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension NotesViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NoteTableViewCell
        let model = dataArr![indexPath.row]
        if model.isEarning{
            cell.left.text = "\(model.money) \(model.type)"
            cell.right.text = ""
        }else{
            cell.right.text = "\(model.type) \(model.money)"
            cell.left.text = ""
        }

        return cell;
    }
    
}
