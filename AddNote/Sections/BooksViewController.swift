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
    
    var dataArr : Array<Book>?

    
    func bind(reactor: Reactor) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "账本"
        
        
        let padding : CGFloat = 30.0
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: ((view.bounds.width-padding*4)/3), height: 130)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: padding, bottom: 0, right: padding)
        
        self.collectionView.collectionViewLayout = layout
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let realm = try! Realm()
        let books = realm.objects(Book.self)
        dataArr = books.filter({ (book) -> Bool in
            book.id >= 0
        })
        collectionView.reloadData()
        
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
        return dataArr?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookcell", for: indexPath) as! BookCollectionViewCell
        
        let book = dataArr![indexPath.item];
        cell.title.text = book.title
        cell.noteCount.text = "\(book.notes.count)笔"
        cell.bookId = book.id
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! BookCollectionViewCell
        
        UserDefaults.standard.set(cell.bookId, forKey: "selectedBook")
        self.tabBarController?.selectedIndex = 0
        
    }
}
