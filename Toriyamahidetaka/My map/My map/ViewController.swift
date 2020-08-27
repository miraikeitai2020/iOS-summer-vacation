//
//  ViewController.swift
//  My map
//
//  Created by 鳥山英峻 on 2020/08/22.
//  Copyright © 2020 鳥山英峻. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Text Fieldのdelegate通知さきを指定
        inputText.delegate = self
    }
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispMap: MKMapView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        //1 キーボードを閉じる
        textField.resignFirstResponder()
        
        //2 入力された文字を取り出す
        if let searchKey = textField.text{
            
            //3 入力された文字をデバッグエリアに表示
            print(searchKey)
            
            //5 GLgeocoderインスタンスを取得
            let geocoder = CLGeocoder()
            
            //6 入力された文字から位置情報を取得
            geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarks,error) in
                
                //7 位置情報が存在する場合umwrapPlacemarksに取り出す
                if let unwrapPlacemarks = placemarks {
                    
                    //8 .firstを使ってunwarpの先頭を取り出す
                    if let firstPlacemark = unwrapPlacemarks.first {
                        
                        //9 firstPlacemarkから位置情報を取り出す
                        if let location = firstPlacemark.location {
                            
                            //10 locationのcoordinateから緯度経度を取り出す
                            let targetCoordinate = location.coordinate
                            
                            //11 10で取得した緯度経度をデバッグエリアに表示
                            print(targetCoordinate)
                            
                            //12 インスタンスの所得　ピンの生成
                            let pin = MKPointAnnotation()
                            
                            //13 ピンの位置情報として緯度経度を設定
                            pin.coordinate = targetCoordinate
                            
                            //14 ピンのタイトルを設定
                            pin.title = searchKey
                            
                            //15 ピンをselfで地図に配置
                            self.dispMap.addAnnotation(pin)
                            
                            //16 マップの中心をピンの緯度経度へ、表示する比率を500mにする
                            self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                    }
                }
            }
        })
    }
        
        //4 デフォルト動作を行うのでtureを返す
        return true
    }
    
    //ボタンが押されるたびmapが変化する
    @IBAction func changeMapButton(_ sender: Any) {
        if dispMap.mapType == .standard {
            dispMap.mapType = .satellite
        }else if dispMap.mapType == .satellite{
            dispMap.mapType = .hybrid
        }else if dispMap.mapType == .hybrid{
            dispMap.mapType = .satelliteFlyover
        }else if dispMap.mapType == .satelliteFlyover{
            dispMap.mapType = .hybridFlyover
        }else if dispMap.mapType == .hybridFlyover{
            dispMap.mapType = .mutedStandard
        } else {
            dispMap.mapType = .standard
        }
    }
    
}
