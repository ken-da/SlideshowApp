//
//  ViewController.swift
//  SlideshowApp
//
//  Created by KTC次世代 on 2022/09/21.
//
// 参考元URL:https://seeku.hateblo.jp/entry/2016/07/02/204854   ボタンによる画像変更(進む/戻る)について
//          https://teratail.com/questions/166259              画像の自動再生/停止について

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var autoButton: UIButton!
    
    //再生停止ボタンの状態を示すフラグ
    var autoFlag : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        displayImage()
    }
    
    //表示している画像の番号、配列からの取り出しにも利用
    //最初の画像を表示しておく
    var dispImageNo = 0
    
    func displayImage() {
    
       //画像の名前の配列
        let imageNameArray = [
                   "1.jpg",
                   "2.jpg",
                   "3.jpg",
               ]
    
        //表示する画像番号を取り出す
        let name = imageNameArray[dispImageNo]
        
        //取り出した番号を読み込み
        let image = UIImage(named: name)
        
        //UIImageViewに読み込み画像をセット
        imageView.image = image
        
    }
        
        
    @IBAction func nextButton(_ sender: Any) {
        //表示している画像番号を１つ増やす
        
        //画像番号が最後(3)の場合、最初の画像(1)を表示する
        if dispImageNo == 2 {
            dispImageNo = 0
        } else {
            dispImageNo += 1
        }
        
        //画像を表示
        displayImage()
    }
    
    @IBAction func prevButton(_ sender: Any) {
        
        //画像番号が最初(1)の場合、最初の画像(3)を表示する
        if dispImageNo == 0 {
            dispImageNo = 2
        } else {
            //表示している画像番号を１つ減らす
            dispImageNo -= 1
        }
        //画像を表示
        displayImage()
        
    }
    

}

