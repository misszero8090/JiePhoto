//
//  ShowViewController.swift
//  JiePhoto
//
//  Created by LuoYao on 2017/6/28.
//  Copyright © 2017年 ly. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataArray : NSMutableArray?
    @IBOutlet weak var CustomLayout: UICollectionViewFlowLayout!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Show Photo"
        
        CustomLayout.itemSize = CGSize.init(width: UIScreen.main.bounds.size.width / 4.0, height:UIScreen.main.bounds.size.width / 4.0)
        CustomLayout.minimumLineSpacing = 0.0
        CustomLayout.minimumInteritemSpacing = 0
        
        collectionView.register(UINib.init(nibName: "CustomCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        self.prefectData()
    }
    
    
    func prefectData() {
        dataArray = NSMutableArray.init()
        let query : BmobQuery = BmobQuery.init(className: "PhotoSource")
        query.findObjectsInBackground { (array, error) in
            
            for i in 0...(array?.count)! - 1{
                let obj = array?[i] as! BmobObject
                let file = obj.object(forKey: "imageFile") as! BmobFile
                self.dataArray?.add(file)

                DispatchQueue.main.async(execute: { 
                    self.collectionView.reloadData()
                })
            }
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.init(red: CGFloat(arc4random() % 256) / 255.0, green: CGFloat(arc4random() % 256) / 255.0, blue: CGFloat(arc4random() % 256) / 255.0, alpha: 1)
        let file : BmobFile = dataArray![indexPath.row] as! BmobFile
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
