//
//  ViewController.swift
//  MyCamera
//
//  Created by keita on 2020/08/14.
//  Copyright © 2020 keita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        //カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("カメラは利用できます")
            //(1)UIImagePickerControllerのインスタンスを作成
            let imagePickerController = UIImagePickerController()
            //(2)sourceTypeにcameraを設定
            imagePickerController.sourceType = .camera
            //(3)delegate設定
            imagePickerController.delegate = self
            //(4)モーダルビューで表示
            present(imagePickerController, animated: true, completion: nil)
        }else {
            print("カメラは利用できません")
        }
    }
    
    @IBAction func shereButtonAction(_ sender: Any) {
        //表示画像をアンラップして表示画像を取り出す。
        if let shareImage = pictureImage.image {
            //UIActivityControllerに渡す配列を作成
            let shareItems = [shareImage]
            //UIActivityViewCnotrollerにシェア画像を渡す
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            //ipadで落ちてしまう対策
            controller.popoverPresentationController?.sourceView = view
            //UIActivityViewControllerを表示
            present(controller, animated: true, completion: nil)
            
        }
    }
    //(1)撮影が終わった時に呼ばれるdelegateメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //(2)撮影した画像を配置したpictureImageを渡す
        pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        //(3)モーダルビューを閉じる
        dismiss(animated: true, completion: nil)
    }
    
}

