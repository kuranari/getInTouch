//
//  SubmitController.swift
//  getInTouch
//
//  Created by 倉成 智久 on 2017/09/17.
//  Copyright © 2017年 倉成 智久. All rights reserved.
//

import WatchKit
import Foundation


class SubmitController: WKInterfaceController {
    
    @IBOutlet var myLabel: WKInterfaceLabel!
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    var count = 0;
    @IBAction func onTapButton() {
        // 通信先のURLを生成.
        let url:NSURL = NSURL(string: "https://api.github.com/users")!
        // セッションの生成.
        let session = URLSession(configuration: URLSessionConfiguration.default)
        // 通信のタスクを生成.
        let task = session.dataTask(with: url as URL, completionHandler: {
            (data, response, err) in
            
            if let _data = data {
                // 帰ってきたデータを文字列に変換.
                let getData: NSString = NSString(data: _data, encoding: String.Encoding.utf8.rawValue)!
                
                // バックグラウンドだとUIの処理が出来ないので、メインスレッドでUIの処理を行わせる.
                DispatchQueue.main.async(execute: {
                    self.myLabel.setText(getData as String)
                    self.popToRootController()
                })
            }
        })
        
        // タスクの実行.
        task.resume()
    }
}
