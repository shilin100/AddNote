//
//  MineViewController.swift
//  AddNote
//
//  Created by 123 on 2018/5/28.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift
import StoreKit


class MineViewController: UIViewController,StoryboardView{
    var disposeBag = DisposeBag()
    typealias Reactor = MineViewReactor
    let dataArr = ["关于我们","好评鼓励","问题反馈"]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    func bind(reactor: Reactor) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension MineViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 ;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let   cell = tableView.dequeueReusableCell(withIdentifier: "MineCell", for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        
        
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let cell = tableView.cellForRow(at: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutUsViewController")
            self.navigationController?.pushViewController(vc, animated: true)

            break
        case 1:
            SKStoreReviewController.requestReview()

            break
        case 2:
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SuggestViewController")
            self.navigationController?.pushViewController(vc, animated: true)

            break

        default:
            break
        }

        
    }

    
    
    
}

