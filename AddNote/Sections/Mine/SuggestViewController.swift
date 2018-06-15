//
//  SuggestViewController.swift
//  AddNote
//
//  Created by 123 on 2018/6/13.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import SVProgressHUD

class SuggestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "问题反馈"

        // Do any additional setup after loading the view.
    }

    @IBAction func submit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        SVProgressHUD.showSuccess(withStatus: "提交成功，感谢您的反馈")
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
