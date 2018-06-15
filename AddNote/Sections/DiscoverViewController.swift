//
//  DiscoverViewController.swift
//  AddNote
//
//  Created by 123 on 2018/6/14.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import SVProgressHUD
import SDWebImage

class DiscoverViewController: UIViewController {
    var newDataArr = [Dictionary<String, Any>]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        DouBanProvider.request(.channels) { result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                if data == nil {
                    return
                }
                
                let json = JSON(data!)
                let dic = json.dictionaryObject
                
                self.newDataArr = dic?["data"] as! [Dictionary<String, Any>]
                //刷新表格数据
                self.tableView.reloadData()
            }
        }
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

extension DiscoverViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newDataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        if  self.newDataArr.count > indexPath.row {
            let temp = self.newDataArr[indexPath.row]
            cell.title.text = temp["title"] as? String
            cell.date.text = temp["publishDateStr"] as? String
            let ImgUrl = (temp["imageUrls"] as? Array<String>)?.first ?? "https://img.zcool.cn/community/0113ce596f13c6a8012193a3eff959.jpg@2o.jpg"
            cell.url = temp["url"] as? String
            
            cell.img.sd_setImage(with: URL(string: ImgUrl), placeholderImage: UIImage(named: "timg"), options: .retryFailed, completed: nil)
            
        }
        
        cell.img.snp .updateConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 98, height: 68))
        }
        
        //        cell.title.snp .updateConstraints { (make) in
        //            make.top.equalTo(cell.img.snp.top)
        //            make.left.equalToSuperview().offset(6)
        
        //        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        if cell.url != nil{
            let vc = WebViewViewController()
            vc.URL = cell.url!
            vc.navigationItem.title = "每日新闻"
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}

