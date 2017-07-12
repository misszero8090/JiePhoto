//
//  UPloadViewController.swift
//  JiePhoto
//
//  Created by LuoYao on 2017/6/28.
//  Copyright © 2017年 ly. All rights reserved.
//

import UIKit

class UPloadViewController: UIViewController,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var preView: UIImageView!
    @IBOutlet weak var desText: UITextView!

    var cameraPicker: UIImagePickerController!
    var photoPicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "upload photo";
        
        let leftBtn : UIBarButtonItem = UIBarButtonItem.init(title: "Show", style: UIBarButtonItemStyle.plain, target: self, action:#selector(leftBtnAction))
        self.navigationItem.rightBarButtonItem = leftBtn
            
    }
    
    
    func leftBtnAction() {
        let show = ShowViewController()
        self.navigationController?.pushViewController(show, animated: true)
        
    }
    
    @IBAction func chooseAction(_ sender: UIButton) {
        self.initPhotoPicker()
    }
    
    
    @IBAction func uploadAction(_ sender: UIButton) {
        
        self.initCameraPicker()
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        if preView.image == nil {
            return;
        }
        //上传
        let format = DateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        let stringDate = format.string(from: NSDate() as Date)
        
        let bmObj : BmobObject = BmobObject.init(className: "PhotoSource")
        let bmFile : BmobFile = BmobFile.init(fileName: stringDate.appending(".jpg"), withFileData: UIImageJPEGRepresentation(preView.image!, 0.5))
        
        bmFile.saveInBackground(byDataSharding: { (success, error) in
            if success {
                bmObj.setObject(bmFile, forKey: "imageFile")
                bmObj.setObject(self.desText.text, forKey: "imageDes")
                bmObj.saveInBackground()
            }
        }){ (progress) in
            self.progressView.progress = Float(progress)
        }
        
    }
    
    
    //MARK: - Method
    func initCameraPicker(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.sourceType = .camera
            cameraPicker.view.backgroundColor = UIColor.white
            //在需要的地方present出来
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    func initPhotoPicker(){
        photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .photoLibrary
        photoPicker.view.backgroundColor = UIColor.white
        //在需要的地方present出来
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        //获得照片
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        preView.image = image
        
        print(info)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    
}
