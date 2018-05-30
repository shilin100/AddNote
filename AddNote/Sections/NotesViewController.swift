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
import RxDataSources
import Differentiator


class NotesViewController: UIViewController,StoryboardView {
    @IBOutlet weak var earningLabel: UILabel!
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
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
        return 3;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NoteTableViewCell

        cell.left.text = "left"
        cell.right.text = "right"

        return cell;
    }
    
}
