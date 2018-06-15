//
//  WebViewViewController.swift
//  Draw
//
//  Created by 123 on 2018/6/7.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    public var URL = "www.baidu.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        //添加
        self.view.addSubview(webview)
        
        //请求
        /*
         open func load(_ request: URLRequest) -> WKNavigation?
         */
        
        webview.load(NSURLRequest(url: NSURL(string: self.URL )! as URL) as URLRequest)
        
        // Do any additional setup after loading the view.
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
