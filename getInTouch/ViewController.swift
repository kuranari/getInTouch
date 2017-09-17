//
//  ViewController.swift
//  getInTouch
//
//  Created by 倉成 智久 on 2017/09/16.
//  Copyright © 2017年 倉成 智久. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myLabel: UILabel!
    
    var count = 0;
    @IBAction func onTapButton(_ sender: Any) {

        // 通信先のURLを生成.
        let url: NSURL = NSURL(string:"https://api.github.com/users")!
        // リクエストを生成.
        let request: NSURLRequest  = NSURLRequest(url: url as URL)
        // 送信処理を始める.
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) { (response, data, erroe) in
            
            // 受け取ったデータのnil判定.
            if let _data = data {
                print(_data)
                // 帰ってきたデータを文字列に変換.
                let getData: NSString = NSString(data: _data, encoding: String.Encoding.utf8.rawValue)!
                // TextViewにセット.
                self.myLabel.text = getData as String
            }
        }
    }
}

