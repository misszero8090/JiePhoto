//
//  PhotoCollectionViewCell.swift
//  JiePhoto
//
//  Created by LuoYao on 2017/5/31.
//  Copyright © 2017年 ly. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var img:UIImage?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        let imgView : UIImageView = UIImageView.init(frame: self.bounds);
        imgView.image = img;
        self.addSubview(imgView);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
