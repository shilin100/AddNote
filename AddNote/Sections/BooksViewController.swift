//
//  BooksViewController.swift
//  AddNote
//
//  Created by 123 on 2018/5/28.
//  Copyright © 2018年 shilin. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class BooksViewController: UIViewController,StoryboardView {
    var disposeBag = DisposeBag()
    typealias Reactor = BooksViewReactor

    func bind(reactor: Reactor) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
