//
//  ViewController.swift
//  My Janken
//
//  Created by 鳥山英峻 on 2020/08/08.
//  Copyright © 2020 鳥山英峻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBOutlet weak var answerImageView: UIImageView!
    
    @IBOutlet weak var answerLable: UILabel!
    
    //カウント
    var count = 0
    var boom = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
        
        boom = count
        count = Int.random(in: 0..<3)
        
        //boom == countとなる限り実行される
        while(boom == count){
            count = Int.random(in: 0..<3)
        }
        
        if (count == 0){
            answerLable.text = "グー"
            answerImageView.image = UIImage(named:"gu")
        }
        else if (count == 1){
            answerLable.text = "チョキ"
            answerImageView.image = UIImage(named:"choki")
        }
        else if (count == 2){
            answerLable.text = "パー"
            answerImageView.image = UIImage(named:"pa")
        }
        
        
    }
    
    
}

