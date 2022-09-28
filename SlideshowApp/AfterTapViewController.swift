//
//  AfterTapViewController.swift
//  SlideshowApp
//
//  Created by KTC次世代 on 2022/09/26.
//

import UIKit

class AfterTapViewController: UIViewController {

    var expImage : UIImage!
    
    //拡大画像を表示する
    @IBOutlet weak var image: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        image?.image = expImage
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
