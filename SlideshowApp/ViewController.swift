//
//  ViewController.swift
//  SlideshowApp
//
//  Created by KTC次世代 on 2022/09/21.
//
// 参考元URL:https://seeku.hateblo.jp/entry/2016/07/02/204854       ボタンによる画像変更(進む/戻る)について
//          https://teratail.com/questions/166259                  画像の自動再生/停止について
//          https://qiita.com/kamimi01/items/1162a6884e6060ed6b17  ボタン無効化/有効化　切替について

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var autoButton: UIButton!
    
    //再生停止ボタンの状態を示すフラグ
    var autoFlag : Bool = false
    
    //自動再生時のタイマー
    var timer: Timer!
    
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
        
        
    @IBAction func nextImage(_ sender: Any) {
        
        //画像番号が最後(3)の場合、最初の画像(1)を表示する
        //error故意発生のため、2→3へ変更
        if dispImageNo == 2 {
            dispImageNo = 0
        } else {
            
            //表示している画像番号を１つ増やす
            dispImageNo += 1
        }
        
        //画像を表示
        displayImage()
    }
    
    @IBAction func prevImage(_ sender: Any) {
        
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
    
    
    @IBAction func autoImage(_ sender: Any) {
        if autoFlag == false {
            //ボタン表記、停止へ変更
            autoButton.setTitle("停止", for: .normal)
            
            //進むボタン、戻るボタン 無効化
            nextButton.isEnabled = false
            prevButton.isEnabled = false
        
            //nilの場合のみ、再生ボタンをタップすると自動再生、2秒毎にスライド
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil , repeats: true)
            }
            autoFlag = true
        } else {
            //ボタン表記、再生へ変更
            autoButton.setTitle("再生", for: .normal)
            
            //進むボタン、戻るボタン 有効化
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            
            //自動再生を停止,自動再生再開時のためnilを代入
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            
            autoFlag = false
        }
        
    }
    
    @objc func onTimer(_ timer: Timer) {

        //画像番号が最後(3)の場合、最初の画像(1)を表示する
        if dispImageNo == 2 {
            dispImageNo = 0
        } else {
            //表示している画像番号を１つ増やす
            dispImageNo += 1
        }
        
        //画像を表示
        displayImage()
    }
    
    //画像タップ時に画面遷移を実施
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
  
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AfterTapViewController:AfterTapViewController = segue.destination as! AfterTapViewController
        AfterTapViewController.expImage = imageView.image
    }
    
    //画面遷移先から戻ってくる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }

}

