//
//  CustomViewController.swift
//  JiePhoto
//
//  Created by LuoYao on 2017/5/23.
//  Copyright © 2017年 ly. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI();
        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let tableView = UITableView.init(frame: UIScreen.main.bounds);
    
    
    
    func initData() {
        let _ = [1,4,10,8,19,21];
        var numsV = [1,4,10,8,19,21];
        
        numsV.sort();
        
        print("nums",numsV);
        
//        forTest();
    }
    
    func initUI() {
        self.view.backgroundColor = UIColor.white;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = UIColor.gray;
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell");
        self.view.addSubview(tableView);
        
    }
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3;
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")!;
        cell.textLabel?.text = String.init(indexPath.row);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selectIndexPath:",indexPath.row);
        if indexPath.row < 10 {
            self.navigationController?.pushViewController(TouchPasswordViewController(), animated: true);
            return;
        }
        let masVC : MasViewController = MasViewController();
        self.navigationController?.pushViewController(masVC, animated: true);
    }
    
}
