//
//  JieSearchViewController.swift
//  JiePhoto
//
//  Created by LuoYao on 2017/7/3.
//  Copyright © 2017年 ly. All rights reserved.
//

import UIKit

class JieSearchViewController: UISearchController {

    override init(searchResultsController: UIViewController?) {
        let before : SearchBeforeViewController = SearchBeforeViewController.init(nibName: "SearchBeforeViewController", bundle: Bundle.main)
        super.init(searchResultsController: before)
        self.step()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "SearchBeforeViewController", bundle: Bundle.main)
        self.step()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.step()
    }
    
    
    func step() {
        self.searchBar.placeholder = "搜索所有"
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
