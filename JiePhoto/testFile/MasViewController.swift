//
//  MasViewController.swift
//  JiePhoto
//
//  Created by LuoYao on 2017/5/25.
//  Copyright © 2017年 ly. All rights reserved.
//

import UIKit

class MasViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    lazy var photoStreamView : UICollectionView = {
        let layout : CustomLayout = CustomLayout.init();
        let cll : UICollectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout);
        cll.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        cll.delegate = self;
        cll.dataSource = self;
        return cll;
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mas";
        self.view.addSubview(photoStreamView);
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell;
        cell.img = UIImage.init(named: "");
        
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let colorRun = UIColor.init(red:red, green:green, blue:blue , alpha: 1)
        
        cell.backgroundColor = colorRun;
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select",indexPath.row);
    }
    

}
