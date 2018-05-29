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
        
        tableview.register(NoteTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableview.separatorStyle = .none

        let sections: [MultipleSectionModel] = [
            .ImageProvidableSection(title: "Section 1",
                                    items: [.ImageSectionItem(image: UIImage(named: "settings")!, title: "General")]),
            .StepperableSection(title: "Section 3",
                                items: [.StepperSectionItem(title: "1")])
        ]
        
        let dataSource = NotesViewController.dataSource()
        
        Observable.just(sections)
            .bind(to: tableview.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

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

extension NotesViewController {
    static func dataSource() -> RxTableViewSectionedReloadDataSource<MultipleSectionModel> {
        return RxTableViewSectionedReloadDataSource<MultipleSectionModel>(
            configureCell: { (dataSource, table, idxPath, _) in
                switch dataSource[idxPath] {
                case let .ImageSectionItem(image, title):
                    let cell: NoteTableViewCell = table.dequeueReusableCell(forIndexPath: idxPath)
//                    cell.titleLabel.text = title
//                    cell.cellImageView.image = image
                    
                    return cell
                case let .StepperSectionItem(title):
                    let cell: NoteTableViewCell = table.dequeueReusableCell(forIndexPath: idxPath)
//                    cell.titleLabel.text = title
                    
                    return cell
                }
        },
            titleForHeaderInSection: { dataSource, index in
                let section = dataSource[index]
                return section.title
        }
        )
    }
}


enum MultipleSectionModel {
    case ImageProvidableSection(title: String, items: [SectionItem])
    case StepperableSection(title: String, items: [SectionItem])
}

enum SectionItem {
    case ImageSectionItem(image: UIImage, title: String)
    case StepperSectionItem(title: String)
}

extension MultipleSectionModel: SectionModelType {
    typealias Item = SectionItem
    
    var items: [SectionItem] {
        switch  self {
        case .ImageProvidableSection(title: _, items: let items):
            return items.map {$0}
        case .StepperableSection(title: _, items: let items):
            return items.map {$0}
        }
    }
    
    init(original: MultipleSectionModel, items: [Item]) {
        switch original {
        case let .ImageProvidableSection(title: title, items: _):
            self = .ImageProvidableSection(title: title, items: items)
        case let .StepperableSection(title, _):
            self = .StepperableSection(title: title, items: items)
        }
    }
}

extension MultipleSectionModel {
    var title: String {
        switch self {
        case .ImageProvidableSection(title: let title, items: _):
            return title
        case .StepperableSection(title: let title, items: _):
            return title
        }
    }
}

