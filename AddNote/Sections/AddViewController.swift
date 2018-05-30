//
//  AddViewController.swift
//  AddNote
//
//  Created by 123 on 2018/5/30.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit

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
