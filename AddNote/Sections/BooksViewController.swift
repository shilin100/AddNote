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
import SnapKit
import RealmSwift

class BooksViewController: UIViewController,StoryboardView {
    var disposeBag = DisposeBag()
    typealias Reactor = BooksViewReactor

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArr : Results<Book>?

    
    func bind(reactor: Reactor) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let padding : CGFloat = 30.0
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (view.bounds.width-padding*4)/3, height: 100)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 50
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: padding, bottom: 0, right: padding)
        
        self.collectionView.collectionViewLayout = layout
        

    }

    func creatBook(){
        let bookView = UIView()
        bookView.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.5882352941, blue: 0.5333333333, alpha: 1)
        bookView.layer.cornerRadius = 5;
        bookView.clipsToBounds = true;
        self.view .addSubview(bookView)
        
        let titleLabel = UILabel()
        titleLabel.text = "123"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .white
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension BooksViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookcell", for: indexPath) as! BookCollectionViewCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
