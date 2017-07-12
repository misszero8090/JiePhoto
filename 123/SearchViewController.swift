//
//  SearchViewController.swift
//  JiePhoto
//
//  Created by LuoYao on 2017/7/4.
//  Copyright © 2017年 ly. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate,UISearchResultsUpdating,UISearchControllerDelegate,UITableViewDelegate,UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableview = UITableView.init(frame: UIScreen.main.bounds)
        tableview.delegate = self
        tableview.dataSource = self
        
        self.view.addSubview(tableview)
    
        let jieSearchVC = UISearchController.init(searchResultsController: nil)
//        jieSearchVC.searchResultsUpdater = self
//        jieSearchVC.dimsBackgroundDuringPresentation = false
//        jieSearchVC.definesPresentationContext = true
//        jieSearchVC.delegate = self
//        jieSearchVC.searchBar.delegate = self
//        jieSearchVC.searchBar.sizeToFit()
        
        tableview.tableHeaderView = jieSearchVC.searchBar
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        }
        cell?.backgroundColor = UIColor.red
        return cell!
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
    
    func updateSearchResults(for searchController: UISearchController) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
