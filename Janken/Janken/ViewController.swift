//
//  ViewController.swift
//  Janken
//
//  Created by keita on 2020/08/06.
//  Copyright © 2020 keita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //ジャンケン(数字)
    var answerNumber = 0
    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func shuffleAction(_ sender: Any) {
        var newAnswerNumber = 0
        repeat{
            newAnswerNumber=Int.random(in: 0..<3)
        }while answerNumber == newAnswerNumber
        
        answerNumber = newAnswerNumber
        
        if answerNumber == 0 {
            //グー
        answerLabel.text = "グー "
        answerImageView.image = UIImage(named:"gu")
        }
        else if answerNumber == 1 {
            //チョキ
            answerLabel.text = "チョキ "
            answerImageView.image = UIImage(named:"choki")
        }
        else if answerNumber == 2 {
            //パー
            answerLabel.text = "パー "
            answerImageView.image = UIImage(named:"pa")
        }
    }
    
}

