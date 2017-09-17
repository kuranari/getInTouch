//
//  InterfaceController.swift
//  getInTouchWatch Extension
//
//  Created by 倉成 智久 on 2017/09/16.
//  Copyright © 2017年 倉成 智久. All rights reserved.
//

import WatchKit
import Foundation

class ReasonsController: WKInterfaceController {
    let reasons: [String] = ["体調不良", "電車遅延", "家庭の事情", "私用"]
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        tableView.setNumberOfRows(reasons.count, withRowType: "ReasonRowController")
        
        for (n, c) in reasons.enumerated() {
            let row = tableView.rowController(at: n) as! ReasonRowController
            row.label.setText(c)
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
//    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
//        self.pushController(withName: "reasonController", context: reasons[rowIndex])
//    }
}
